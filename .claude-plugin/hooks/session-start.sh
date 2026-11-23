#!/usr/bin/env bash
# Confirms the plugin is loaded by printing its name and version at session start.
manifest="${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json"

field() { sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$manifest" | head -n1; }

name="$(field name)"
version="$(field version)"
msg="${name:-dart-flutter-plugin} v${version:-unknown} is active"

printf '{"systemMessage":"%s"}\n' "$msg"
