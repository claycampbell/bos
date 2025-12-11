# Quick Deploy Cheat Sheet

## 🚀 Deploy in 60 Seconds

### Option 1: Netlify (Fastest)
```
1. Go to https://app.netlify.com/drop
2. Drag agent-feedback-session.html
3. Share the URL
```

### Option 2: GitHub Pages
```bash
# Create repo, then:
git add agent-feedback-session.html
git commit -m "Add feedback page"
git push
# Enable Pages in repo settings
```

### Option 3: Vercel
```bash
npm i -g vercel
vercel --prod
```

---

## 💾 Collect Feedback in 5 Minutes

### Google Sheets Setup

**1. Create Sheet**
- New Google Sheet

**2. Apps Script**
- Extensions → Apps Script
- Paste code from FEEDBACK-SESSION-SETUP.md

**3. Deploy**
- Deploy → New deployment → Web app
- Execute as: Me
- Access: Anyone
- Copy URL

**4. Configure HTML**
```javascript
const CONFIG = {
    googleSheetsUrl: 'YOUR_URL_HERE',
    // ...
};
```

**Done!** Feedback saves to sheet automatically.

---

## 📋 Alternative: Formspree (3 minutes)

```
1. Go to https://formspree.io
2. Create form
3. Copy endpoint URL
4. Add to CONFIG.webhookUrl
```

Responses emailed to you.

---

## ✅ No Setup Needed

**Already works with localStorage!**

Just:
1. Share the deployed URL
2. Users fill out feedback
3. Click "Export as JSON" to download

---

## 🎯 Quick Test

After deploying:

```
1. Open URL
2. Click "▶ Start Interview" (Discovery)
3. Watch simulation
4. Rate it (click stars)
5. Click "Save to Cloud" button
6. Check Google Sheet for new row
```

If row appears → ✅ You're ready!

---

## 🔧 Minimal Configuration

Only need to set ONE of these:

```javascript
const CONFIG = {
    googleSheetsUrl: '',  // OR
    webhookUrl: '',       // OR
    // Leave both empty for localStorage only
};
```

Everything else works out-of-the-box!
