# Project Phoenix - Azure Static Web App Deployment Script
# This script automates the deployment of the agent feedback session to Azure

param(
    [Parameter(Mandatory=$false)]
    [string]$AppName = "phoenix-feedback",

    [Parameter(Mandatory=$false)]
    [string]$ResourceGroup = "rg-phoenix-feedback",

    [Parameter(Mandatory=$false)]
    [string]$Location = "eastus",

    [Parameter(Mandatory=$false)]
    [string]$GitHubRepo = "",

    [Parameter(Mandatory=$false)]
    [switch]$SkipGitPush
)

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Project Phoenix - Azure Deployment                      ║" -ForegroundColor Cyan
Write-Host "║   Agent Feedback Session SPA                               ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Function to check if command exists
function Test-Command {
    param($Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# Step 1: Verify prerequisites
Write-Host "📋 Step 1: Checking prerequisites..." -ForegroundColor Yellow

if (-not (Test-Command git)) {
    Write-Host "❌ Git is not installed. Please install Git first." -ForegroundColor Red
    exit 1
}

if (-not (Test-Command az)) {
    Write-Host "❌ Azure CLI is not installed." -ForegroundColor Red
    Write-Host "   Install: winget install Microsoft.AzureCLI" -ForegroundColor Gray
    exit 1
}

Write-Host "✓ Git found" -ForegroundColor Green
Write-Host "✓ Azure CLI found" -ForegroundColor Green

# Step 2: Check Azure login
Write-Host ""
Write-Host "📋 Step 2: Checking Azure login..." -ForegroundColor Yellow

$azAccount = az account show 2>$null | ConvertFrom-Json
if (-not $azAccount) {
    Write-Host "⚠️  Not logged into Azure. Launching login..." -ForegroundColor Yellow
    az login
    $azAccount = az account show | ConvertFrom-Json
}

Write-Host "✓ Logged in as: $($azAccount.user.name)" -ForegroundColor Green
Write-Host "  Subscription: $($azAccount.name)" -ForegroundColor Gray

# Step 3: Verify files exist
Write-Host ""
Write-Host "📋 Step 3: Verifying deployment files..." -ForegroundColor Yellow

$requiredFiles = @(
    "agent-feedback-session.html",
    "index.html",
    "staticwebapp.config.json"
)

$allFilesExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✓ Found: $file" -ForegroundColor Green
    } else {
        Write-Host "❌ Missing: $file" -ForegroundColor Red
        $allFilesExist = $false
    }
}

if (-not $allFilesExist) {
    Write-Host "❌ Required files are missing. Ensure you're in the /docs directory." -ForegroundColor Red
    exit 1
}

# Step 4: Git setup
if (-not $SkipGitPush) {
    Write-Host ""
    Write-Host "📋 Step 4: Git repository setup..." -ForegroundColor Yellow

    # Check if git repo exists
    if (-not (Test-Path ..\.git)) {
        Write-Host "Initializing git repository..." -ForegroundColor Gray
        git init ..
    }

    # Get GitHub repo URL
    if (-not $GitHubRepo) {
        $remoteUrl = git -C .. config --get remote.origin.url 2>$null
        if ($remoteUrl) {
            Write-Host "✓ Found existing remote: $remoteUrl" -ForegroundColor Green
            # Extract repo name from URL
            if ($remoteUrl -match 'github\.com[:/](.+/.+?)(\.git)?$') {
                $GitHubRepo = $matches[1] -replace '\.git$', ''
            }
        } else {
            Write-Host "⚠️  No GitHub remote found." -ForegroundColor Yellow
            $GitHubRepo = Read-Host "Enter your GitHub repo (username/repo)"

            Write-Host "Adding GitHub remote..." -ForegroundColor Gray
            git -C .. remote add origin "https://github.com/$GitHubRepo.git"
        }
    }

    # Commit changes
    Write-Host "Committing changes..." -ForegroundColor Gray
    git -C .. add docs/
    $commitResult = git -C .. commit -m "Deploy agent feedback session to Azure" 2>&1

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Changes committed" -ForegroundColor Green
    } else {
        Write-Host "⚠️  $commitResult" -ForegroundColor Yellow
    }

    # Push to GitHub
    Write-Host "Pushing to GitHub..." -ForegroundColor Gray
    git -C .. push -u origin main 2>&1

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Pushed to GitHub" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to push to GitHub. Please push manually." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host ""
    Write-Host "📋 Step 4: Skipping Git operations (--SkipGitPush)" -ForegroundColor Yellow

    # Still need to get the repo name
    if (-not $GitHubRepo) {
        $GitHubRepo = Read-Host "Enter your GitHub repo (username/repo)"
    }
}

# Step 5: Create Azure Resource Group
Write-Host ""
Write-Host "📋 Step 5: Creating Azure Resource Group..." -ForegroundColor Yellow

$rgExists = az group exists --name $ResourceGroup | ConvertFrom-Json
if ($rgExists) {
    Write-Host "✓ Resource group exists: $ResourceGroup" -ForegroundColor Green
} else {
    Write-Host "Creating resource group: $ResourceGroup in $Location..." -ForegroundColor Gray
    az group create --name $ResourceGroup --location $Location | Out-Null
    Write-Host "✓ Resource group created" -ForegroundColor Green
}

# Step 6: Check if Static Web App exists
Write-Host ""
Write-Host "📋 Step 6: Checking Static Web App..." -ForegroundColor Yellow

$existingApp = az staticwebapp list --resource-group $ResourceGroup --query "[?name=='$AppName']" | ConvertFrom-Json

if ($existingApp.Count -gt 0) {
    Write-Host "✓ Static Web App exists: $AppName" -ForegroundColor Green
    $appUrl = $existingApp[0].defaultHostname
    Write-Host "  URL: https://$appUrl" -ForegroundColor Cyan

    $recreate = Read-Host "Do you want to recreate it? (y/N)"
    if ($recreate -eq 'y' -or $recreate -eq 'Y') {
        Write-Host "Deleting existing app..." -ForegroundColor Gray
        az staticwebapp delete --name $AppName --resource-group $ResourceGroup --yes | Out-Null
        $createNew = $true
    } else {
        $createNew = $false
    }
} else {
    $createNew = $true
}

# Step 7: Create Static Web App
if ($createNew) {
    Write-Host ""
    Write-Host "📋 Step 7: Creating Static Web App..." -ForegroundColor Yellow
    Write-Host "This may take 2-3 minutes..." -ForegroundColor Gray

    # Need GitHub token for automated setup
    Write-Host ""
    Write-Host "⚠️  GitHub Personal Access Token Required" -ForegroundColor Yellow
    Write-Host "   1. Go to: https://github.com/settings/tokens/new" -ForegroundColor Gray
    Write-Host "   2. Scopes needed: repo, workflow" -ForegroundColor Gray
    Write-Host "   3. Copy the token" -ForegroundColor Gray
    Write-Host ""

    $githubToken = Read-Host "Enter GitHub Personal Access Token (or press Enter to skip automation)" -AsSecureString
    $githubTokenPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($githubToken)
    )

    if ($githubTokenPlain) {
        # Automated creation with GitHub integration
        $result = az staticwebapp create `
            --name $AppName `
            --resource-group $ResourceGroup `
            --source "https://github.com/$GitHubRepo" `
            --location $Location `
            --branch main `
            --app-location "/docs" `
            --token $githubTokenPlain `
            --login-with-github | ConvertFrom-Json

        $appUrl = $result.defaultHostname
        Write-Host "✓ Static Web App created with GitHub Actions" -ForegroundColor Green
    } else {
        # Manual creation without GitHub automation
        $result = az staticwebapp create `
            --name $AppName `
            --resource-group $ResourceGroup `
            --location $Location | ConvertFrom-Json

        $appUrl = $result.defaultHostname
        Write-Host "✓ Static Web App created" -ForegroundColor Green
        Write-Host ""
        Write-Host "⚠️  Manual GitHub setup required:" -ForegroundColor Yellow
        Write-Host "   1. Get deployment token: az staticwebapp secrets list --name $AppName --resource-group $ResourceGroup" -ForegroundColor Gray
        Write-Host "   2. Add to GitHub Secrets as AZURE_STATIC_WEB_APPS_API_TOKEN" -ForegroundColor Gray
        Write-Host "   3. Create GitHub Actions workflow (see AZURE-DEPLOYMENT.md)" -ForegroundColor Gray
    }

    Write-Host ""
    Write-Host "🌐 Your site will be available at:" -ForegroundColor Cyan
    Write-Host "   https://$appUrl" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "📋 Step 7: Using existing Static Web App" -ForegroundColor Yellow
}

# Step 8: Final instructions
Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║   ✓ Deployment Complete!                                   ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Your feedback session URL:" -ForegroundColor Cyan
Write-Host "   https://$appUrl" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Next Steps:" -ForegroundColor Yellow
Write-Host "   1. Wait 2-3 minutes for GitHub Actions to deploy" -ForegroundColor Gray
Write-Host "   2. Check deployment: GitHub repo → Actions tab" -ForegroundColor Gray
Write-Host "   3. Test the site at the URL above" -ForegroundColor Gray
Write-Host "   4. Configure data collection (see FEEDBACK-SESSION-SETUP.md)" -ForegroundColor Gray
Write-Host "   5. Share URL with feedback session participants" -ForegroundColor Gray
Write-Host ""
Write-Host "📈 Monitor deployment:" -ForegroundColor Yellow
Write-Host "   GitHub Actions: https://github.com/$GitHubRepo/actions" -ForegroundColor Cyan
Write-Host "   Azure Portal: https://portal.azure.com/#resource/subscriptions/$($azAccount.id)/resourceGroups/$ResourceGroup/providers/Microsoft.Web/staticSites/$AppName" -ForegroundColor Cyan
Write-Host ""
Write-Host "🔧 Useful commands:" -ForegroundColor Yellow
Write-Host "   View details:  az staticwebapp show --name $AppName --resource-group $ResourceGroup" -ForegroundColor Gray
Write-Host "   Get token:     az staticwebapp secrets list --name $AppName --resource-group $ResourceGroup" -ForegroundColor Gray
Write-Host "   Delete:        az staticwebapp delete --name $AppName --resource-group $ResourceGroup --yes" -ForegroundColor Gray
Write-Host ""
