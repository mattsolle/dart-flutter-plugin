---
name: push-changes
description: Push the current branch's commits to its GitHub remote safely. Use when the user asks to push their commits.
---

# Push changes

Push already-committed work to GitHub. This skill does not create commits.

## Steps

1. Run `git status -sb` and `git branch --show-current` to learn the branch and whether it tracks a remote.
2. If there are uncommitted changes, tell the user and stop. Do not commit them here (the `commit-changes` skill does that).
3. Check `git log @{u}..HEAD --oneline` (or `git log --oneline -5` when there is no upstream yet) so you know what will be pushed.
   - Nothing to push: say so and stop.
4. Push:
   - Branch already tracks a remote: `git push`
   - No upstream yet: `git push -u origin <branch>`
5. Never use `--force` or `--force-with-lease`. If the push is rejected because the remote has new commits, stop and tell the user. Suggest `git pull --rebase`, but do not run it unasked.
6. If authentication fails, tell the user to run `gh auth login` (they can type `! gh auth login` in the prompt) and then retry.
7. Report the branch, the commits pushed, and the remote.
