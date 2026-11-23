---
name: commit-and-push
description: Commit all current changes and push them to GitHub by running the commit-changes skill and then the push-changes skill. Use when the user is done editing and wants to ship their changes.
disable-model-invocation: true
---

# Commit and push

Run these two skills in order. The user typing this command is their go-ahead to commit and push.

1. Invoke the `commit-changes` skill (via the Skill tool). Wait for it to finish.
   - If it reports nothing to commit and there are no unpushed commits, stop here.
   - If it fails, stop and report why. Do not continue to the push.
2. Invoke the `push-changes` skill. Wait for it to finish.
3. Finish with a short summary: the commit subject(s) created, and the branch and remote they were pushed to.

Do not add your own commit or push logic here; the two skills own that.
