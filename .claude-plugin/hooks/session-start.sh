#!/usr/bin/env bash
# Confirms the plugin is loaded by showing a short, readable banner at session start.
root="${CLAUDE_PLUGIN_ROOT}"
manifest="${root}/.claude-plugin/plugin.json"

field() { sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$manifest" | head -n1; }

name="$(field name)"
version="$(field version)"
description="$(field description)"

agents=""
for f in "${root}"/.claude-plugin/agents/*.md; do
  [ -e "$f" ] || continue
  agents="${agents:+$agents, }$(basename "$f" .md)"
done

# Build message with JSON-escaped newlines (\n).
msg="✓ ${name:-dart-flutter-plugin} v${version:-unknown} loaded"
[ -n "$description" ] && msg="${msg}\\n  ${description}"
[ -n "$agents" ] && msg="${msg}\\n  Agents: ${agents}"

printf '{"systemMessage":"%s"}\n' "$msg"
