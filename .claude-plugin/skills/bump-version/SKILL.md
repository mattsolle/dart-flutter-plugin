---
name: bump-version
description: Bump the plugin version in plugin.json, commit the bump, and create a matching git tag (for example v1.1.0). Use when the user asks to bump the version or cut a release.
---

# Bump version

Bump `version` in `.claude-plugin/plugin.json`, commit it, and tag the commit. Do not push; the `push-changes` skill pushes the commit and the tag.

Versions follow semantic versioning (`MAJOR.MINOR.PATCH`). Tags are the version with a `v` prefix: `1.1.0` becomes `v1.1.0`.

## Steps

1. Make sure the working tree is clean (`git status --short`). If it is not, tell the user to commit first (the `commit-changes` skill does that) and stop.
2. Read the current `version` from `.claude-plugin/plugin.json`.
3. Find the latest tag with `git describe --tags --abbrev=0 2>/dev/null`. List commits since it with `git log <tag>..HEAD --oneline` (all commits if there is no tag).
   - If there are no commits since the latest tag, nothing needs releasing: say so and stop.
4. Choose the bump level:
   - If the user named one (`major`, `minor`, `patch`, or an exact version), use it.
   - Otherwise infer it from the commit subjects since the last tag: any `feat:` gives **minor**; anything else (`fix:`, `docs:`, `chore:`, and so on) gives **patch**. Only choose **major** when the user asks, since breaking changes are not marked in commit messages.
   - Resetting lower parts: minor sets patch to 0, major sets minor and patch to 0.
5. Edit only the `version` value in `.claude-plugin/plugin.json`.
6. Commit with the message `chore: Bump version to <new version>` (for example `chore: Bump version to 1.1.0`).
7. Create an annotated tag on that commit: `git tag -a v<new version> -m "v<new version>"`. If the tag already exists, stop and tell the user rather than moving or deleting it.
8. Report the old version, the new version, the level chosen and why, and the tag created.
