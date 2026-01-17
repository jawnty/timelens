# TimeLens - Claude Code Instructions

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

## Secrets Management

**NEVER commit API keys, secrets, or credentials to git.** Use these patterns:

- **Gemini API key**: Pass via `--dart-define=GEMINI_API_KEY=xxx` at build time
- **Firebase config**: `google-services.json` is gitignored; use the `.template` file as reference
- **Other secrets**: Store in `CLAUDE.local.md` (gitignored) or environment variables

Build commands:
```bash
flutter build apk --debug --dart-define=GEMINI_API_KEY=xxx
flutter run --dart-define=GEMINI_API_KEY=xxx
```

## Local Configuration

See `CLAUDE.local.md` for sensitive project information (API keys, tester emails, project IDs). That file is git-ignored and not committed to the repository.
