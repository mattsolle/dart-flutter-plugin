---
name: commit-and-push
description: Commit all current changes, bump the version and tag it, then push the commits and tag to GitHub by running the commit-changes, bump-version, and push-changes skills in order. Use when the user is done editing and wants to ship their changes.
disable-model-invocation: true
---

# Commit and push

Run these skills in order. The user typing this command is their go-ahead to commit, tag, and push. Pass along any bump level the user gave (`major`, `minor`, `patch`, or an exact version).

1. Invoke the `commit-changes` skill (via the Skill tool). Wait for it to finish.
   - If it reports nothing to commit and there are no unpushed commits, stop here.
   - If it fails, stop and report why. Do not continue.
2. Invoke the `bump-version` skill. Wait for it to finish.
   - If it reports nothing to release, continue to the push anyway.
   - If it fails, stop and report why. Do not push.
3. Invoke the `push-changes` skill. It pushes the commits and the new tag.
4. Finish with a short summary: the commit subject(s) created, the new version and tag, and the branch and remote they were pushed to.

Do not add your own commit, tag, or push logic here; the three skills own that.
