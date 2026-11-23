---
name: push-changes
description: Push the current branch's commits and any annotated version tags to its GitHub remote safely. Use when the user asks to push their commits.
---

# Push changes

Push already-committed work, along with its version tags, to GitHub. This skill does not create commits or tags.

## Steps

1. Run `git status -sb` and `git branch --show-current` to learn the branch and whether it tracks a remote.
2. If there are uncommitted changes, tell the user and stop. Do not commit them here (the `commit-changes` skill does that).
3. See what will be pushed:
   - Commits: `git log @{u}..HEAD --oneline` (or `git log --oneline -5` when there is no upstream yet).
   - Tags: `git tag --points-at HEAD` and `git ls-remote --tags origin` to spot local tags the remote lacks.
   - Nothing to push (no new commits and no new tags): say so and stop.
4. Push the branch together with the annotated tags that point at the commits being pushed:
   - Branch already tracks a remote: `git push --follow-tags`
   - No upstream yet: `git push -u origin <branch> --follow-tags`
5. Never use `--force` or `--force-with-lease`, and never delete or move remote tags. If the push is rejected because the remote has new commits, stop and tell the user. Suggest `git pull --rebase`, but do not run it unasked.
6. If authentication fails, tell the user to run `gh auth login` (they can type `! gh auth login` in the prompt) and then retry.
7. Report the branch, the commits pushed, the tags pushed, and the remote.
