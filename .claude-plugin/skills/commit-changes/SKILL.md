---
name: commit-changes
description: Commit the current working-tree changes with a Conventional Commits subject line that also follows the seven rules of a good commit message. Use when the user asks to commit their changes.
---

# Commit changes

Commit the user's current changes using a single-line message. Do not push.

## Message format

```
<type>: <Description>
```

Combines the Conventional Commits 1.0.0 format with the seven rules of a good commit message. Only the required part of Conventional Commits is used. **Do not add** a scope, a body, footers, or a `!` breaking-change marker.

Rules:

1. `<type>` is lowercase and one of:
   - `feat`: a new feature
   - `fix`: a bug fix
   - `docs`: documentation only
   - `style`: formatting, no code meaning change
   - `refactor`: neither a fix nor a feature
   - `perf`: performance improvement
   - `test`: adding or correcting tests
   - `build`: build system or dependencies
   - `ci`: CI configuration
   - `chore`: anything else that doesn't touch source or tests
   - `revert`: reverts an earlier commit
2. The whole subject line, including `type: `, is **50 characters or fewer**.
3. The description starts with a **capital letter**.
4. **No period** at the end.
5. **Imperative mood**: "Add", "Fix", "Remove", not "Added" or "Adds". It should complete the sentence "If applied, this commit will ___".
6. Describe **what** changed. Keep it specific; avoid "update stuff" or "changes".

Good: `feat: Add session start version banner`
Bad: `feat(hooks): added a banner that shows the version.`

## Steps

1. Run `git status --short` and `git diff HEAD` (plus `git diff --stat` if large) to see everything that changed. If there is nothing to commit, say so and stop.
2. Choose the single best `<type>` for the change. If the changes are clearly unrelated (for example a feature and an unrelated docs fix), make separate commits, staging only the relevant files for each.
3. Stage the files with `git add`. Do not stage anything that looks like a secret (`.env`, credentials, keys); warn the user and leave it out.
4. Write the subject line following the rules above and count its length. If over 50 characters, shorten it.
5. Commit with `git commit -m "<subject>"`.
6. Report the commit hash and subject. If a hook rejects the commit, fix the cause and make a new commit; never use `--no-verify` or `--amend` unless the user asks.
