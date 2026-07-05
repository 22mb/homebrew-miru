# Homebrew formula for miru (custom tap: 22mb/homebrew-miru).
#
# Installs the pre-built single-file binary from GitHub Releases of 22mb/miru
# (built with `bun build --compile`, so no Bun runtime is required at install time).
#
# `version`, every `url` tag, and every `sha256` below are bumped automatically by
# the release CI on each tagged release. The sha256 values are placeholders until
# then. See Formula/README.md for the tap layout and the bump workflow.
class Miru < Formula
  desc "Inline review for AI-generated Markdown and HTML, fully local"
  homepage "https://github.com/22mb/miru"
  version "2026.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "699c3553868776f771147b2f6312a9f9ca09cb6d126bf11e069d6c95f04c58a4"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "5e85f863e63e8fac65d5138518645a312ce12c9d54c5feee6f9c3c18f55ea0ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "382ef886b01268fdb4aeb8d6eb7b21eb9ae9e690c0960eb018ef6b7696cd1ab2"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "1b78333379eb506e0848b592128864b4a9854d41727ddc04af3a71500fceae09"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["miru-*"].first => "miru"
  end

  test do
    # miru prints a usage line to stderr and exits 1 when invoked with no/invalid args.
    assert_match "usage", shell_output("#{bin}/miru 2>&1", 1)
  end
end
