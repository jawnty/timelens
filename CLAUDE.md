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

## Local Configuration

See `CLAUDE.local.md` for sensitive project information (API keys, tester emails, project IDs). That file is git-ignored and not committed to the repository.
