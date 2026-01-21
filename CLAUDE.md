# TimeLens - Claude Code Instructions

## Security & Privacy Rules (CRITICAL)

**READ THIS FIRST. These rules are non-negotiable.**

### Never Commit Secrets
NEVER hardcode or commit any of the following to git:
- API keys (e.g., `AIza...`, `sk-...`, `ghp_...`)
- OAuth client IDs and secrets
- Database credentials
- Private keys or certificates
- Tokens of any kind

**Before every commit**, verify no secrets are staged:
```bash
git diff --cached | grep -iE "(api_key|apikey|secret|password|token|AIza|sk-)"
```

### Never Commit PII
NEVER commit personally identifiable information:
- Email addresses
- Phone numbers
- Real names (unless public/authorized)
- Physical addresses
- Any user data

### Where to Store Sensitive Data
- **CLAUDE.local.md** - Gitignored file for API keys, project IDs, tester emails
- **Environment variables** - For runtime secrets
- **--dart-define** - For build-time secrets in Flutter
- **.template files** - Commit templates, gitignore the real files

### Files That Must Be Gitignored
```
CLAUDE.local.md           # Local secrets and PII
android/app/google-services.json  # Firebase config with API keys
ios/Runner/GoogleService-Info.plist  # iOS Firebase config
.env                      # Environment variables
*.keystore               # Signing keys
```

### If You Accidentally Commit Secrets
1. **Immediately** rewrite git history to remove them
2. **Rotate** all exposed credentials
3. **Verify** removal with `git log -p --all -S "secret_pattern"`
4. **Force push** to overwrite remote history

---

## Versioning

Follow semantic versioning (semver.org) for all releases:

```
version: MAJOR.MINOR.PATCH+BUILD
```

- **MAJOR**: Breaking changes or major redesigns
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes and minor improvements (e.g., icon changes, config fixes)
- **BUILD**: Must increment with every release to Firebase App Distribution

Example progression:
- 1.0.0+1 - Initial release
- 1.0.0+2 - Config fix
- 1.0.1+3 - App icon added
- 1.1.0+4 - New feature added

Update the version in `pubspec.yaml` before each build that will be distributed.

## Firebase App Distribution

When adding testers, use `firebase appdistribution:testers:add` first, then add them to an existing release rather than re-uploading the binary.

### Deployment Guidelines

**DO NOT deploy for every small fix.** Deployments notify all testers and are disruptive.

- **Batch changes** - Accumulate multiple fixes/improvements before deploying
- **Ask before deploying** - Always check with the user before running `firebase appdistribution:distribute`
- **Only deploy when**:
  - User explicitly requests a deployment
  - A critical bug fix is needed (app crashing, security issue)
  - A meaningful set of changes is ready for testing

When making code changes, commit to git but wait for user approval before building and distributing.

## Build Commands

Always use the build commands from `CLAUDE.local.md` which include the required API keys:
```bash
# Get the actual command from CLAUDE.local.md - it has the real API key
flutter build apk --debug --dart-define=GEMINI_API_KEY=<from_CLAUDE.local.md>
```

## Local Configuration

See `CLAUDE.local.md` for:
- Actual API keys and credentials
- Tester email addresses
- Project IDs and Firebase app IDs
- Any other sensitive configuration

That file is git-ignored and must never be committed.
