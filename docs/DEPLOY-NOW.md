# 🚀 Deploy to Azure Now - Quick Start

## One-Command Deployment

```powershell
cd docs
.\deploy-to-azure.ps1
```

That's it! The script will:
- ✅ Check prerequisites (Git, Azure CLI)
- ✅ Login to Azure (if needed)
- ✅ Commit and push to GitHub
- ✅ Create Azure Static Web App
- ✅ Set up GitHub Actions deployment
- ✅ Give you the live URL

**Time**: 5-10 minutes

---

## Prerequisites (One-time setup)

### 1. Install Azure CLI (if not installed)

```powershell
winget install Microsoft.AzureCLI
```

### 2. Login to Azure

```powershell
az login
```

### 3. Create GitHub Personal Access Token

1. Go to https://github.com/settings/tokens/new
2. Token name: "Azure Static Web Apps"
3. Scopes: Select `repo` and `workflow`
4. Click "Generate token"
5. **Copy the token** (you'll need it during deployment)

---

## Deployment Steps

### Step 1: Navigate to docs folder

```powershell
cd c:\Users\ClayCampbell\Documents\GitHub\bos\docs
```

### Step 2: Run deployment script

```powershell
.\deploy-to-azure.ps1
```

The script will prompt for:
- **GitHub repo**: Your repo in format `username/bos`
- **GitHub token**: Paste the token you created above

### Step 3: Wait for deployment

- Script creates Azure resources (2-3 minutes)
- GitHub Actions builds and deploys (3-5 minutes)
- You get a URL like: `https://gentle-sea-123456.azurestaticapps.net`

### Step 4: Verify

1. Wait 5 minutes for deployment to complete
2. Visit your URL
3. Test all 3 agent simulations
4. Click "Save to Cloud" to verify it works

---

## Custom Options

### Custom app name

```powershell
.\deploy-to-azure.ps1 -AppName "my-feedback-session"
```

### Different region

```powershell
.\deploy-to-azure.ps1 -Location "westeurope"
```

### Skip Git operations (if already pushed)

```powershell
.\deploy-to-azure.ps1 -SkipGitPush
```

### All options

```powershell
.\deploy-to-azure.ps1 `
    -AppName "phoenix-feedback" `
    -ResourceGroup "rg-phoenix" `
    -Location "eastus" `
    -GitHubRepo "yourname/bos"
```

---

## What Gets Created

| Resource | Name | Purpose |
|----------|------|---------|
| Resource Group | `rg-phoenix-feedback` | Container for resources |
| Static Web App | `phoenix-feedback` | Hosts your SPA |
| GitHub Action | Auto-created | Deploys on every push |

**Cost**: Free tier (100GB bandwidth/month) - $0

---

## After Deployment

### Configure Data Collection

Edit `agent-feedback-session.html`:

```javascript
const CONFIG = {
    googleSheetsUrl: 'YOUR_GOOGLE_SHEETS_URL',  // See FEEDBACK-SESSION-SETUP.md
    // OR
    webhookUrl: 'YOUR_FORMSPREE_URL',
};
```

Then push changes:

```powershell
git add agent-feedback-session.html
git commit -m "Configure data collection"
git push
```

Azure auto-deploys in 2-3 minutes.

### Share with Participants

```
Subject: Feedback Session - Project Phoenix Agents

Hi Team,

Please provide feedback on our agent designs:

🔗 https://phoenix-feedback.azurestaticapps.net

⏱️ 20-30 minutes
🎮 Interactive simulations
💾 Auto-saves your progress

Complete by [DATE]. Thanks!
```

### Monitor Submissions

- **Google Sheets**: See responses in real-time
- **Formspree**: Get emails with each submission
- **Azure Portal**: View site analytics

---

## Update Your Site

Just push to GitHub - Azure auto-deploys:

```powershell
# Make changes
code agent-feedback-session.html

# Commit and push
git add .
git commit -m "Update feedback form"
git push

# Azure rebuilds automatically (2-3 min)
```

---

## Cleanup After Feedback Session

```powershell
# Delete everything
az staticwebapp delete --name phoenix-feedback --resource-group rg-phoenix-feedback --yes
az group delete --name rg-phoenix-feedback --yes

# Or keep for future sessions (Free tier = $0)
```

---

## Troubleshooting

### "Azure CLI not found"
```powershell
winget install Microsoft.AzureCLI
# Restart PowerShell
```

### "Not logged in to Azure"
```powershell
az login
```

### "GitHub token invalid"
- Create new token: https://github.com/settings/tokens/new
- Ensure `repo` and `workflow` scopes selected

### "Deployment failed"
Check GitHub Actions:
1. Go to your repo on GitHub
2. Click "Actions" tab
3. View the latest workflow run
4. Check logs for errors

### Site not loading
- Wait 5 minutes for CDN propagation
- Check GitHub Actions completed successfully
- Try incognito/private browser window

---

## Need Help?

See detailed docs:
- **Full Azure guide**: [AZURE-DEPLOYMENT.md](AZURE-DEPLOYMENT.md)
- **Data collection setup**: [FEEDBACK-SESSION-SETUP.md](FEEDBACK-SESSION-SETUP.md)
- **Quick reference**: [QUICK-DEPLOY.md](QUICK-DEPLOY.md)

Or open an issue in the GitHub repo.

---

## ✅ You're Ready!

Once deployed, you have:
- ✅ Professional Azure-hosted SPA
- ✅ HTTPS with custom domain support
- ✅ Global CDN for fast loading worldwide
- ✅ Automatic deployments from GitHub
- ✅ Free SSL certificate
- ✅ 100GB bandwidth/month (free tier)

**Share the URL and collect feedback!** 🎉
