# Firebase Deployment Commands

## 🚀 WIP Deployment
https://marketiniya-wip.web.app/home

**Setup (once):**
```bash

firebase target:apply hosting wip marketiniya-wip --project marketiniya-wip
```

**Deploy:**
```bash

flutter build web --dart-define=environment=wip
firebase deploy --project marketiniya-wip --only hosting:wip
```

## 🏢 PROD Deployment
https://www.marketiniya.com/home

**Setup (once):**
```bash

firebase target:apply hosting prod ***REMOVED*** --project ***REMOVED***
```

**Deploy:**
```bash

flutter build web --dart-define=environment=prod
firebase deploy --project ***REMOVED*** --only hosting:prod
```

## 📋 Quick Reference

| Environment | Build | Deploy |
|-------------|-------|--------|
| **WIP** | `flutter build web --dart-define=environment=wip` | `firebase deploy --project marketiniya-wip --only hosting:wip` |
| **PROD** | `flutter build web --dart-define=environment=prod` | `firebase deploy --project ***REMOVED*** --only hosting:prod` |

## 🔧 Troubleshooting

**Check targets:**
```bash

firebase target --project marketiniya-wip
firebase target --project ***REMOVED***
```

**List projects:**
```bash

firebase projects:list
```
