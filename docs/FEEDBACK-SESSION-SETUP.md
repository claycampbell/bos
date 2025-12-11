# Agent Feedback Session - Quick Deployment Guide

This guide shows you how to deploy the interactive agent feedback page and collect responses in under 10 minutes.

## 📦 What You Have

A single-file HTML application (`agent-feedback-session.html`) that:
- ✅ Works offline (no dependencies)
- ✅ Saves locally in browser (no data loss)
- ✅ Auto-saves every 30 seconds
- ✅ Can send data to Google Sheets or any webhook
- ✅ Exports feedback as JSON/Text

## 🚀 Quick Deployment (Choose One)

### Option 1: Netlify Drop (Fastest - 1 minute)

1. Go to [https://app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag `agent-feedback-session.html` to the upload zone
3. Get instant live URL: `https://random-name.netlify.app`
4. Share with your feedback session participants

**Pros**: Instant, no account needed, free
**Cons**: Random URL (upgrade to custom domain if needed)

### Option 2: GitHub Pages (2 minutes)

1. Create new GitHub repo (can be private)
2. Upload `agent-feedback-session.html`
3. Go to repo Settings → Pages
4. Enable Pages from `main` branch
5. Get URL: `https://yourname.github.io/repo-name/agent-feedback-session.html`

**Pros**: Free, custom URL, version control
**Cons**: Requires GitHub account

### Option 3: Vercel (2 minutes)

```bash
npm i -g vercel
cd docs
vercel --prod
```

**Pros**: Fast, custom domains, professional
**Cons**: Requires npm/Node.js installed

## 💾 Setting Up Data Collection

### Option A: Google Sheets (Recommended - 5 minutes)

**Why**: Easy to view responses, free, no limits, real-time updates

**Setup:**

1. **Create Google Sheet**
   - New Google Sheet: "Phoenix Agent Feedback"

2. **Add Apps Script**
   - Extensions → Apps Script
   - Delete default code
   - Paste this code:

```javascript
function doPost(e) {
  try {
    var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
    var data = JSON.parse(e.postData.contents);

    // If this is first row, add headers
    if (sheet.getLastRow() === 0) {
      sheet.appendRow([
        'Timestamp',
        'Session ID',
        'Name',
        'Email',
        'Role',
        'Discovery Ratings',
        'Discovery Insights',
        'Discovery Concerns',
        'Discovery Improvements',
        'Vision Ratings',
        'Vision Scenarios',
        'Vision Concerns',
        'Vision Improvements',
        'Sentinel Ratings',
        'Sentinel Mental Models',
        'Sentinel Concerns',
        'Sentinel Improvements'
      ]);
    }

    // Add data row
    sheet.appendRow([
      new Date(data.timestamp),
      data.sessionId,
      data.userInfo.name,
      data.userInfo.email,
      data.userInfo.role,
      JSON.stringify(data.discovery.ratings),
      data.discovery.insights.join(', '),
      data.discovery.concerns,
      data.discovery.improvements,
      JSON.stringify(data.vision.ratings),
      data.vision.scenarios.join(', '),
      data.vision.concerns,
      data.vision.improvements,
      JSON.stringify(data.sentinel.ratings),
      data.sentinel.mentalModels.join(', '),
      data.sentinel.concerns,
      data.sentinel.improvements
    ]);

    return ContentService.createTextOutput(JSON.stringify({success: true}))
      .setMimeType(ContentService.MimeType.JSON);

  } catch(error) {
    return ContentService.createTextOutput(JSON.stringify({success: false, error: error.toString()}))
      .setMimeType(ContentService.MimeType.JSON);
  }
}
```

3. **Deploy Script**
   - Click "Deploy" → "New deployment"
   - Type: **Web app**
   - Execute as: **Me**
   - Who has access: **Anyone**
   - Click "Deploy"
   - Copy the **Web App URL**

4. **Update HTML File**
   - Open `agent-feedback-session.html`
   - Find `CONFIG` section at top of `<script>` tag
   - Paste URL:
   ```javascript
   const CONFIG = {
       googleSheetsUrl: 'YOUR_WEB_APP_URL_HERE',
       // ...
   };
   ```

5. **Test It**
   - Fill out feedback form
   - Click "Save to Cloud"
   - Check Google Sheet for new row

### Option B: Formspree (Easiest - 3 minutes)

**Why**: Zero setup, emails you responses, free tier (50/month)

**Setup:**

1. Go to [https://formspree.io](https://formspree.io)
2. Create free account
3. Create new form: "Phoenix Feedback"
4. Copy form endpoint: `https://formspree.io/f/xxxxx`
5. Update HTML file:
   ```javascript
   const CONFIG = {
       webhookUrl: 'https://formspree.io/f/YOUR_FORM_ID',
       // ...
   };
   ```

6. Responses emailed to you as JSON

### Option C: Local Only (0 minutes)

**No setup needed!** Feedback automatically saves to browser localStorage.

**To retrieve:**
- Open browser console (F12)
- Type: `localStorage.getItem('phoenixFeedback')`
- Copy JSON data

**Or** just click "Export as JSON" in the app.

## 🎯 Running a Feedback Session

### Before the Session

1. **Deploy the page** (choose deployment option above)
2. **Set up data collection** (choose Google Sheets/Formspree)
3. **Test the flow**:
   - Run all 3 simulations
   - Fill out feedback forms
   - Verify data saves correctly
4. **Share the URL** with participants

### During the Session

1. **Intro (5 min)**: Explain Project Phoenix vision
2. **Discovery Demo (10 min)**:
   - Run simulation
   - Explain adaptive conversation flow
   - Show signal detection
   - Collect feedback
3. **Vision Demo (10 min)**:
   - Run simulation
   - Explain weighted scoring
   - Show parallel workspaces
   - Collect feedback
4. **Sentinel Demo (10 min)**:
   - Run simulation
   - Explain mental models
   - Show critique examples
   - Collect feedback
5. **Q&A (10 min)**: Open discussion
6. **Export (5 min)**: Ensure everyone clicks "Save to Cloud"

### After the Session

1. **Review responses** in Google Sheet (or email)
2. **Download backups**: Export as JSON for archival
3. **Analyze patterns**: What ratings were highest/lowest?
4. **Synthesize feedback**: Create summary document
5. **Plan iterations**: Update agent designs based on input

## 📊 Analyzing Feedback

### Google Sheets Analysis

Your sheet will have columns for:
- **Ratings**: Star ratings (1-5) for each capability
- **Checkboxes**: Selected valuable features
- **Open text**: Concerns and improvement suggestions

**Quick Analysis Tips:**

1. **Average Ratings**:
   ```
   =AVERAGE(F2:F100)  // Discovery conversation rating
   ```

2. **Most Common Concerns**:
   - Read through "Concerns" columns
   - Look for repeated themes

3. **Feature Priorities**:
   - Count checkbox selections
   - "Insights" and "Mental Models" columns show what resonated

### Export Analysis

1. Download all responses as JSON
2. Use Python/Node.js to aggregate:
   - Average star ratings per agent
   - Most selected features
   - Word frequency in concerns/improvements

Example Python script:

```python
import json
import glob

responses = []
for file in glob.glob('phoenix-feedback-*.json'):
    with open(file) as f:
        responses.append(json.load(f))

# Average discovery ratings
discovery_ratings = [r['discovery']['ratings'].get('conversation', 0) for r in responses]
avg = sum(discovery_ratings) / len(discovery_ratings)
print(f"Avg Discovery Conversation Rating: {avg:.2f}/5")
```

## 🔧 Configuration Options

Edit the `CONFIG` object in the HTML file:

```javascript
const CONFIG = {
    // Google Sheets URL (from Apps Script deployment)
    googleSheetsUrl: '',

    // Webhook URL (Formspree, Zapier, Make.com, etc.)
    webhookUrl: '',

    // Always save locally (recommended: true)
    useLocalStorage: true,

    // Auto-save interval in milliseconds (30s default)
    autoSaveInterval: 30000
};
```

## 🎨 Customization

### Change Colors/Theme

Find the `:root` CSS variables:

```css
:root {
    --primary: #2563eb;      /* Main blue */
    --secondary: #7c3aed;    /* Purple accent */
    --accent: #f59e0b;       /* Orange highlights */
    --success: #10b981;      /* Green success */
    --danger: #ef4444;       /* Red warnings */
}
```

### Add Your Logo

Insert before the `<header>` tag:

```html
<div style="text-align: center; padding: 2rem;">
    <img src="your-logo.png" alt="Company Logo" style="max-width: 200px;">
</div>
```

### Customize Questions

Edit feedback sections in each agent's HTML section:

```html
<div class="feedback-group">
    <label>Your custom question here?</label>
    <textarea rows="4" id="custom-field"></textarea>
</div>
```

## 🐛 Troubleshooting

### Data Not Saving to Google Sheets

1. **Check URL**: Verify `googleSheetsUrl` is correct
2. **Check Permissions**: Script must be deployed as "Anyone"
3. **Check Console**: Open browser console (F12) for errors
4. **Fallback**: Data still saves locally - export as JSON

### Page Not Loading

1. **Check Browser**: Works best in Chrome/Edge/Firefox
2. **Disable Ad Blockers**: May block Google Sheets requests
3. **Check File Path**: Ensure HTML file uploaded correctly

### Simulations Not Running

1. **Refresh Page**: Hard refresh (Ctrl+Shift+R)
2. **Check JavaScript**: Look for errors in console
3. **Test in Incognito**: Rule out extension conflicts

## 📞 Support

For issues or questions:
1. Check browser console (F12) for error messages
2. Verify CONFIG settings are correct
3. Test with localStorage only first (no cloud save)
4. Export data manually as backup

## ✅ Pre-Session Checklist

- [ ] HTML file deployed and accessible
- [ ] Google Sheets/Formspree configured
- [ ] Test submission successful
- [ ] URL shared with participants
- [ ] Simulations tested and working
- [ ] Backup plan (localStorage export) confirmed

## 🎉 You're Ready!

You now have a professional, interactive feedback collection system that:
- Runs entirely in the browser (no server needed)
- Automatically saves responses to Google Sheets
- Provides engaging simulations of your agents
- Exports data for offline analysis
- Works even if cloud save fails (localStorage backup)

**Estimated Total Setup Time**: 10-15 minutes

Good luck with your feedback session! 🚀
