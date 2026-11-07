#!/usr/bin/env bash
# Render README.md with GitHub's own Markdown API and open it locally.
set -euo pipefail
cd "$(dirname "$0")"
out="${TMPDIR:-/tmp}/profile-preview.html"
body=$(jq -Rs '{text: ., mode: "gfm"}' README.md | gh api markdown --input -)
cat > "$out" <<HTML
<!doctype html><meta charset="utf-8"><title>Profile preview</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.5.1/github-markdown.min.css">
<style>body{background:#0d1117;margin:0}.markdown-body{max-width:888px;margin:32px auto;padding:24px;border:1px solid #30363d;border-radius:6px}</style>
<article class="markdown-body">$body</article>
HTML
open "$out"
echo "$out"
