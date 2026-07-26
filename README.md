# homebrew-miru

Homebrew tap for [miru](https://github.com/22mb/miru) — a local tool for inline review of
AI-generated Markdown / HTML, as rendered in the browser.

## Install

```sh
brew tap 22mb/miru
brew trust 22mb/miru   # required on Homebrew 6.x+ for a third-party tap
brew install miru
```

`brew trust` is a no-op on older Homebrew, where third-party taps load without it.
Afterwards, `brew upgrade miru` picks up new releases and `brew untap 22mb/miru` removes
the tap.

The formula installs the pre-built single-file binary from miru's
[Releases](https://github.com/22mb/miru/releases) — it is compiled with
`bun build --compile`, so no Bun runtime is installed or required. Covered platforms are
macOS (Apple Silicon / Intel) and Linux (arm64 / x86_64); Homebrew does not cover Windows,
so take `miru-windows-x64.exe` from Releases directly.

## Layout

| Path | What it is |
|---|---|
| `Formula/miru.rb` | **Generated.** Edits here are silently overwritten by the next bump. |
| `.github/miru.rb.template` | The actual source of the formula. `{{VERSION}}` and one `{{SHA256_<ASSET>}}` per release binary are substituted at bump time. |
| `.github/workflows/bump.yml` | The "Bump formula" workflow. |

## Bumping the formula

After a miru release is published, run **Bump formula** from the Actions tab. It resolves
the tag (the latest release unless one is given), regenerates the formula from the
template with checksums read from the release's own `.sha256` assets, verifies it with
`brew audit --strict --online`, `brew install` and `brew test`, and opens a PR. Merging
that PR is what reaches tap users. `dry_run` stops after the verification step, which is
also the way to check a template change without opening a PR.

Nothing here runs on a schedule, and nothing in 22mb/miru pushes to this repository — the
two hold no credentials for each other, so a release always ends with a human pressing
this button.

## License

[MIT](LICENSE)
