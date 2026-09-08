#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"
INPUT="${1:-$ROOT_DIR/assets/scripts/redirect/redirect_list_min.txt}"
OUTPUT="${2:-$ROOT_DIR/assets/scripts/redirect/hatena_redirect_snippet.js}"
MIN_OUTPUT="${3:-$ROOT_DIR/assets/scripts/redirect/hatena_redirect_snippet_min.js}"

if [[ ! -f "$INPUT" ]]; then
  echo "Input file not found: $INPUT" >&2
  exit 1
fi

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

{
  cat <<'JS'
(function () {
  "use strict";

  // Old path -> new path mapping generated from redirect_list_min.txt.
  var REDIRECT_MAP = {
JS

  awk '
BEGIN { dup = 0 }
NF >= 2 && $1 ~ /^\// && $2 ~ /^\// {
  old = $1
  new = $2

  if (seen[old]++) {
    dup = 1
    dups[old] = 1
    next
  }

  gsub(/\\/, "\\\\", old)
  gsub(/"/, "\\\"", old)
  gsub(/\\/, "\\\\", new)
  gsub(/"/, "\\\"", new)

  printf "    \"%s\": \"%s\",\n", old, new
}
END {
  if (dup == 1) {
    for (k in dups) {
      printf "Duplicate old path detected: %s\n", k > "/dev/stderr"
    }
    exit 1
  }
}
' "$INPUT" | sed '$ s/,$//'

  cat <<'JS'
  };

  function normalizePath(path) {
    if (!path) return "/";
    var normalized = path.trim();

    normalized = normalized.replace(/\/{2,}/g, "/");

    if (!normalized.startsWith("/")) {
      normalized = "/" + normalized;
    }

    normalized = normalized.replace(/\.html?$/i, "");

    if (!normalized.endsWith("/")) {
      normalized += "/";
    }

    return normalized;
  }

  function candidatePaths(pathname) {
    var candidates = [];

    function pushUnique(path) {
      if (path && candidates.indexOf(path) === -1) {
        candidates.push(path);
      }
    }

    pushUnique(normalizePath(pathname));

    try {
      pushUnique(normalizePath(decodeURIComponent(pathname)));
    } catch (_) {
      // Keep going with the raw pathname if decoding fails.
    }

    return candidates;
  }

  var pathname = window.location.pathname || "/";
  var candidates = candidatePaths(pathname);

  for (var i = 0; i < candidates.length; i++) {
    var destination = REDIRECT_MAP[candidates[i]];
    if (destination) {
      window.location.replace(destination);
      return;
    }
  }

  // Unmapped URLs are intentionally left as 404.
  // Blanket redirects to top page can be treated as soft-404 by search engines.
})();
JS
} > "$tmp_file"

mv "$tmp_file" "$OUTPUT"
echo "Generated: $OUTPUT"

if command -v terser >/dev/null 2>&1; then
  terser "$OUTPUT" -c -m -o "$MIN_OUTPUT"
elif command -v npx >/dev/null 2>&1; then
  npx --yes terser "$OUTPUT" -c -m -o "$MIN_OUTPUT"
else
  echo "terser or npx is required to generate minified output." >&2
  exit 1
fi

echo "Generated: $MIN_OUTPUT"
