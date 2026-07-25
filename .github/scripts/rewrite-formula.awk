# Rewrites a formula for a new upstream release. Reads the formula on stdin/argv and
# writes the updated one to stdout.
#
#   awk -v version=2026.7.11 -v sums=sums.txt -f rewrite-formula.awk Formula/miru.rb
#
# `sums` names a file of "<binary-name> <sha256>" lines. Each `sha256` line is matched to
# a checksum via the binary name in the `url` line directly above it, so the mapping
# follows the formula's own urls instead of a hardcoded platform order — adding, removing
# or reordering platforms needs no change here.
#
# Exits non-zero unless the version line and every checksum in `sums` were replaced. That
# is what stops a renamed asset from silently leaving a stale checksum in place.

BEGIN {
  while ((getline line < sums) > 0) {
    if (split(line, f, " ") == 2) want[f[1]] = f[2]
  }
  close(sums)
}

# The first `version "..."` line is the formula's; anything later belongs to a block we
# must not touch.
!version_done && /^[[:space:]]*version "/ {
  sub(/"[^"]*"/, "\"" version "\"")
  version_done = 1
  print
  next
}

/^[[:space:]]*url "/ {
  pending = ""
  if (match($0, /miru-[^"\/]+"/)) {
    name = substr($0, RSTART, RLENGTH - 1)
    if (name in want) pending = name
  }
  print
  next
}

pending != "" && /^[[:space:]]*sha256 "/ {
  sub(/"[^"]*"/, "\"" want[pending] "\"")
  done[pending] = 1
  pending = ""
  print
  next
}

{ print }

END {
  status = 0
  if (!version_done) {
    print "rewrite-formula: no version line found" > "/dev/stderr"
    status = 1
  }
  for (name in want) {
    if (!(name in done)) {
      print "rewrite-formula: no sha256 line followed the url for " name > "/dev/stderr"
      status = 1
    }
  }
  exit status
}
