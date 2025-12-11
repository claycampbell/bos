# Project Phoenix - Agent Feedback Session

## 🌐 Live Site

**https://zealous-moss-0a2a5c20f.3.azurestaticapps.net**

Share this URL with your feedback session participants!

---

## ✅ Deployment Status

The site is **LIVE** and fully functional:

- ✅ Interactive simulations (Discovery, Vision, Sentinel agents)
- ✅ Feedback forms with star ratings
- ✅ Auto-save to Azure Blob Storage (every 30 seconds)
- ✅ Manual "Save to Cloud" button
- ✅ localStorage backup (if offline)
- ✅ Export as JSON/Text
- ✅ Session tracking with unique IDs

---

## 📊 Viewing Feedback Submissions

Feedback is saved as JSON files in Azure Blob Storage. Each submission creates a file named `session_XXXXX.json`.

### Azure Portal (Easiest)

1. Go to https://portal.azure.com
2. Navigate to: **phoenixfeedbackstore** storage account
3. Click: **Storage Browser** → **Blob containers** → **feedback**
4. Download JSON files to view feedback

### Azure Storage Explorer (Best for Multiple Files)

1. Download: https://azure.microsoft.com/features/storage-explorer/
2. Sign in with your Azure account
3. Navigate to: **phoenixfeedbackstore** → **feedback** container
4. Download all files at once

---

## 🎯 What Participants Will Experience

1. **Open the URL** → Redirects to agent feedback session
2. **Optional: Fill in name/email/role** → Helps you identify respondents
3. **Watch simulations** → Click "Start Interview" for each agent
4. **Provide feedback** → Rate features, select checkboxes, write comments
5. **Auto-saves** → Progress saved every 30 seconds to localStorage
6. **Manual save** → Click "Save to Cloud" button (recommended)
7. **Export** → Can download their responses as JSON/Text

---

## 🔧 How It Works (Technical)

### Frontend (Static Web App)
- Single HTML file with embedded JavaScript
- No build process needed
- Deployed via GitHub Actions to Azure

### Storage (Azure Blob Storage)
- Container: `feedback` (public read access)
- Authentication: SAS token (built into HTML)
- Format: One JSON file per submission
- Expiry: 2026-12-31 (SAS token valid for 1 year)

### Data Flow
```
User fills form → Click Save
  ↓
JavaScript creates JSON
  ↓
PUT request to Azure Blob Storage
  ↓
JSON file created: session_XXXXX.json
  ↓
You download and view in portal
```

---

## 📋 Feedback Data Structure

Each JSON file contains:

```json
{
  "sessionId": "session_1234567890_abc123",
  "userInfo": {
    "name": "John Doe",
    "email": "john@example.com",
    "role": "Product Manager"
  },
  "discovery": {
    "ratings": {
      "conversation": 5,
      "graph": 4
    },
    "insights": ["operational", "strategic"],
    "concerns": "How does it handle edge cases?",
    "improvements": "Add more examples"
  },
  "vision": {
    "ratings": { "scoring": 5, "economics": 4 },
    "scenarios": ["efficiency", "platform"],
    "concerns": "...",
    "improvements": "..."
  },
  "sentinel": {
    "ratings": { "models": 5, "advisory": 5 },
    "mentalModels": ["inversion", "incentives"],
    "concerns": "...",
    "improvements": "..."
  },
  "timestamp": "2025-12-11T20:30:00.000Z",
  "lastSaved": "2025-12-11T20:35:00.000Z"
}
```

---

## 🛠️ Troubleshooting

### "Save to Cloud" doesn't work
1. Check browser console (F12) for errors
2. Verify you're on the live Azure URL (not local file)
3. Try exporting as JSON instead (always works)

### Can't see feedback submissions
1. Make sure someone actually submitted feedback
2. Check Azure Portal → Storage Browser → Blob containers → feedback
3. Files are named `session_XXXXX.json` where X is the session ID

### Want to change something
1. Edit `docs/agent-feedback-session.html`
2. Commit and push to GitHub
3. Azure auto-deploys in 2-3 minutes
4. Check GitHub Actions tab for progress

---

## 📧 Share with Participants

### Email Template

```
Subject: Feedback Needed - Project Phoenix Agent Design

Hi Team,

We need your input on our AI agent designs for Project Phoenix.

🔗 Feedback Session: https://zealous-moss-0a2a5c20f.3.azurestaticapps.net

📅 Please complete by: [DATE]
⏱️ Time required: 20-30 minutes
🎮 Interactive: Includes live simulations of each agent
💾 Auto-saves: Your progress is saved automatically

The session covers three agents:
• Discovery Agent - Conducts stakeholder interviews
• Vision Agent - Generates transformation scenarios
• The Sentinel - Applies critical validation

Your feedback will directly shape our final agent designs.

Questions? Reply to this email.

Thanks!
```

---

## 🗑️ Cleanup (After Session)

To delete all Azure resources:

```bash
az group delete --name rg-phoenix-feedback --yes
```

**Current cost:** $0/month (Free tier)

---

## 📚 Additional Documentation

- [DEPLOYMENT-INFO.md](../DEPLOYMENT-INFO.md) - Deployment details
- [AZURE-DEPLOYMENT.md](AZURE-DEPLOYMENT.md) - Full Azure deployment guide
- [FEEDBACK-SESSION-SETUP.md](FEEDBACK-SESSION-SETUP.md) - Setup instructions
- [DEPLOY-NOW.md](DEPLOY-NOW.md) - Quick deployment guide

---

## ✅ Quick Status Check

Visit these URLs to verify everything works:

- **Live site**: https://zealous-moss-0a2a5c20f.3.azurestaticapps.net
- **Azure portal**: https://portal.azure.com
- **GitHub Actions**: https://github.com/claycampbell/bos/actions

---

**Ready to collect feedback!** 🎉

Share the URL and start gathering insights on your agent designs.
