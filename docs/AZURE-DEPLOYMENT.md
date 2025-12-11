# Azure Static Web App Deployment Guide

Deploy the Project Phoenix Agent Feedback Session as an Azure Static Web App for your review participants.

## 🎯 Overview

**What you'll get:**
- Custom Azure URL: `https://phoenix-feedback.azurestaticapps.net` (or custom domain)
- HTTPS enabled by default
- Global CDN for fast loading
- Free tier available (100GB bandwidth/month)
- Automatic CI/CD from GitHub

**Time to deploy:** 10-15 minutes

---

## 📋 Prerequisites

- Azure account ([Free tier available](https://azure.microsoft.com/free/))
- GitHub account
- Azure CLI (optional, for command-line deployment)

---

## 🚀 Method 1: Azure Portal (Recommended - No CLI needed)

### Step 1: Push to GitHub

1. **Create GitHub Repository**
   ```bash
   cd c:\Users\ClayCampbell\Documents\GitHub\bos

   # If not already a git repo
   git init
   git add docs/
   git commit -m "Add agent feedback session SPA"

   # Create repo on GitHub, then:
   git remote add origin https://github.com/YOUR_USERNAME/bos.git
   git branch -M main
   git push -u origin main
   ```

2. **Verify files are pushed:**
   - `docs/index.html`
   - `docs/agent-feedback-session.html`
   - `docs/staticwebapp.config.json`

### Step 2: Create Azure Static Web App

1. **Go to Azure Portal**
   - Navigate to [https://portal.azure.com](https://portal.azure.com)
   - Sign in with your Azure account

2. **Create Static Web App**
   - Click "Create a resource"
   - Search for "Static Web App"
   - Click "Create"

3. **Configure Basics**
   - **Subscription**: Select your subscription
   - **Resource Group**: Create new → "rg-phoenix-feedback"
   - **Name**: `phoenix-feedback` (or your preferred name)
   - **Plan type**: Free (for development) or Standard (for production)
   - **Region**: Choose closest to participants (e.g., East US, West Europe)
   - **Deployment source**: GitHub

4. **Connect to GitHub**
   - Click "Sign in with GitHub"
   - Authorize Azure Static Web Apps
   - Select:
     - **Organization**: Your GitHub username/org
     - **Repository**: bos
     - **Branch**: main

5. **Build Configuration**
   - **Build Presets**: Custom
   - **App location**: `/docs`
   - **Api location**: (leave empty)
   - **Output location**: (leave empty)

6. **Review + Create**
   - Click "Review + create"
   - Click "Create"

7. **Wait for Deployment**
   - Azure will create the resource (1-2 minutes)
   - GitHub Actions will build and deploy (3-5 minutes)
   - You'll get a URL like: `https://gentle-sea-123456.azurestaticapps.net`

### Step 3: Verify Deployment

1. **Check GitHub Actions**
   - Go to your GitHub repo → Actions tab
   - You should see a workflow running
   - Wait for green checkmark ✓

2. **Test Your Site**
   - Open the Azure URL
   - Should redirect to agent-feedback-session.html
   - Test all 3 simulations
   - Verify feedback forms work

### Step 4: Configure Custom Domain (Optional)

1. **In Azure Portal**
   - Go to your Static Web App resource
   - Click "Custom domains" in left menu
   - Click "+ Add"
   - Enter your domain: `feedback.yourcompany.com`
   - Follow DNS configuration instructions
   - Azure provides free SSL certificate

---

## 🚀 Method 2: Azure CLI (Faster for developers)

### Prerequisites
```bash
# Install Azure CLI
winget install Microsoft.AzureCLI

# Login to Azure
az login

# Install Static Web Apps extension
az extension add --name staticwebapp
```

### Deploy

```bash
# Set variables
$RESOURCE_GROUP="rg-phoenix-feedback"
$LOCATION="eastus"
$APP_NAME="phoenix-feedback"
$GITHUB_REPO="YOUR_USERNAME/bos"
$GITHUB_TOKEN="YOUR_GITHUB_PAT"  # Create at github.com/settings/tokens

# Create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create static web app
az staticwebapp create `
  --name $APP_NAME `
  --resource-group $RESOURCE_GROUP `
  --source https://github.com/$GITHUB_REPO `
  --location $LOCATION `
  --branch main `
  --app-location "/docs" `
  --token $GITHUB_TOKEN `
  --login-with-github

# Get the URL
az staticwebapp show `
  --name $APP_NAME `
  --resource-group $RESOURCE_GROUP `
  --query "defaultHostname" -o tsv
```

---

## 🚀 Method 3: GitHub Actions Only (No Azure Portal)

If you have an Azure service principal:

1. **Create `.github/workflows/azure-static-web-apps.yml`:**

```yaml
name: Azure Static Web Apps CI/CD

on:
  push:
    branches:
      - main
  pull_request:
    types: [opened, synchronize, reopened, closed]
    branches:
      - main

jobs:
  build_and_deploy_job:
    if: github.event_name == 'push' || (github.event_name == 'pull_request' && github.event.action != 'closed')
    runs-on: ubuntu-latest
    name: Build and Deploy Job
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
      - name: Build And Deploy
        id: builddeploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/docs"
          api_location: ""
          output_location: ""

  close_pull_request_job:
    if: github.event_name == 'pull_request' && github.event.action == 'closed'
    runs-on: ubuntu-latest
    name: Close Pull Request Job
    steps:
      - name: Close Pull Request
        id: closepullrequest
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          action: "close"
```

2. **Add Secret:**
   - Get deployment token from Azure Portal (Static Web App → Manage deployment token)
   - GitHub repo → Settings → Secrets → Actions
   - Add secret: `AZURE_STATIC_WEB_APPS_API_TOKEN`

---

## 📊 Configure Data Collection for Azure

Since you're deploying to Azure, here are the best options:

### Option 1: Google Sheets (Still works great with Azure)

No changes needed! The Google Sheets setup from the HTML file works perfectly with Azure deployment.

### Option 2: Azure Functions + Cosmos DB (Full Azure stack)

If you want to keep everything in Azure:

1. **Create Cosmos DB** (NoSQL database)
2. **Create Azure Function** (API endpoint)
3. **Update CONFIG** in HTML to point to your Function URL

I can provide the Azure Function code if you want to go this route.

### Option 3: Azure Storage Tables (Simplest Azure option)

1. **Create Storage Account**
2. **Get SAS token** with write permissions
3. **Use Azure Tables REST API** directly from browser

---

## 🔒 Security & Access Control

### Public Access (Default)
- Anyone with URL can access
- Good for: Wide feedback collection

### Restrict Access (Optional)

**Option A: Azure AD Authentication**
```bash
# Enable authentication
az staticwebapp users update `
  --name $APP_NAME `
  --resource-group $RESOURCE_GROUP `
  --authentication-type aad
```

**Option B: Simple Password Protection**

Add to `staticwebapp.config.json`:
```json
{
  "routes": [
    {
      "route": "/*",
      "allowedRoles": ["authenticated"]
    }
  ],
  "auth": {
    "identityProviders": {
      "azureActiveDirectory": {
        "registration": {
          "openIdIssuer": "https://login.microsoftonline.com/YOUR_TENANT_ID",
          "clientIdSettingName": "AAD_CLIENT_ID",
          "clientSecretSettingName": "AAD_CLIENT_SECRET"
        }
      }
    }
  }
}
```

**Option C: Invite-Only Links**

Add query parameter checking in JavaScript (I can add this if needed).

---

## 📈 Monitor Usage

### View Analytics

1. **Azure Portal**
   - Go to Static Web App resource
   - Click "Metrics" in left menu
   - View:
     - Requests per day
     - Data transfer
     - Response times
     - Geographic distribution

2. **Application Insights** (Optional)
   - Add Application Insights to track:
     - User sessions
     - Page views
     - Feedback submissions
     - Errors

---

## 🎯 Share with Participants

### Your Azure URL

After deployment, you'll get a URL like:
```
https://gentle-sea-123456.azurestaticapps.net
```

**For better branding:**

1. **Custom subdomain** (Free):
   - `feedback.yourcompany.com`
   - Configure in Azure Portal → Custom domains

2. **Shortened URL**:
   - Use bit.ly or your company's link shortener
   - Example: `bit.ly/phoenix-agents-feedback`

### Email Template

```
Subject: Feedback Needed - Project Phoenix Agent Design

Hi Team,

We need your input on our new AI agent designs (Discovery, Vision, and Sentinel agents).

📋 Feedback Session Link: https://phoenix-feedback.azurestaticapps.net

⏱️ Time Required: 20-30 minutes
🎮 Interactive: Includes live simulations of each agent
💾 Auto-saves: Your progress is automatically saved

Please complete by [DATE]. Your feedback will directly influence our final agent designs.

Questions? Reply to this email.

Thanks!
```

---

## 🔧 Update Deployed Site

Automatic updates via GitHub:

```bash
# Make changes to HTML file
code docs/agent-feedback-session.html

# Commit and push
git add docs/
git commit -m "Update feedback form"
git push

# Azure automatically rebuilds (2-3 minutes)
# Check GitHub Actions tab for progress
```

---

## 💰 Cost Estimate

**Free Tier:**
- 100GB bandwidth/month
- Unlimited apps
- Free SSL
- **Cost**: $0/month

**Standard Tier** (if you exceed free tier):
- $9/month base
- $0.20/GB over 100GB
- Custom domains: Free
- **Estimated for feedback session**: $9-15/month

**Note**: For a feedback session with 20-50 participants, Free Tier is more than sufficient.

---

## ✅ Deployment Checklist

- [ ] Code pushed to GitHub
- [ ] Azure Static Web App created
- [ ] Deployment successful (check GitHub Actions)
- [ ] Site accessible at Azure URL
- [ ] All 3 simulations working
- [ ] Feedback forms functional
- [ ] Data collection configured (Google Sheets/Azure/Formspree)
- [ ] Test submission successful
- [ ] Custom domain configured (if applicable)
- [ ] URL shared with participants
- [ ] Monitoring enabled

---

## 🐛 Troubleshooting

### Deployment Failed
**Check:**
1. GitHub Actions logs for errors
2. `staticwebapp.config.json` syntax
3. App location is set to `/docs`

**Fix:**
```bash
# Re-trigger deployment
git commit --allow-empty -m "Trigger rebuild"
git push
```

### Site Not Loading
**Check:**
1. Azure Static Web App status (Portal → Overview)
2. Browser console for errors
3. Network tab for failed requests

**Fix:**
- Wait 5 minutes for CDN propagation
- Clear browser cache
- Try incognito mode

### Simulations Not Working
**Check:**
1. Browser console for JavaScript errors
2. Content Security Policy headers

**Fix:**
Update `staticwebapp.config.json` to allow inline scripts (already configured).

### Data Not Saving
**Check:**
1. `CONFIG.googleSheetsUrl` is set correctly
2. Google Apps Script is deployed as "Anyone"
3. Browser console for fetch errors

**Fix:**
- Test Google Sheets URL directly
- Check CORS settings
- Verify Apps Script permissions

---

## 🎉 You're Live!

Once deployed, you have:
- ✅ Professional Azure-hosted SPA
- ✅ HTTPS enabled by default
- ✅ Global CDN for fast loading
- ✅ Auto-deployment from GitHub
- ✅ Free SSL certificate
- ✅ Analytics and monitoring
- ✅ Custom domain support

**Next Steps:**
1. Share URL with feedback session participants
2. Monitor submissions in Google Sheets
3. Analyze feedback after session
4. Update agent designs based on input

---

## 📞 Need Help?

**Azure Support:**
- [Azure Static Web Apps Documentation](https://docs.microsoft.com/azure/static-web-apps/)
- [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)

**Quick Commands:**
```bash
# View deployment logs
az staticwebapp show --name phoenix-feedback --resource-group rg-phoenix-feedback

# List all static web apps
az staticwebapp list --output table

# Delete (cleanup after feedback session)
az staticwebapp delete --name phoenix-feedback --resource-group rg-phoenix-feedback --yes
```

Good luck with your feedback session! 🚀
