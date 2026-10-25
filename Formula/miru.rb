# GENERATED FILE — edit .github/miru.rb.template, not this file. The Bump formula
# workflow (.github/workflows/bump.yml) regenerates it after every upstream release, and
# an edit made here disappears at that point with no warning.
#
# Homebrew formula for miru (custom tap: 22mb/homebrew-miru).
#
# Installs the pre-built single-file binary from GitHub Releases of 22mb/miru
# (built with `bun build --compile`, so no Bun runtime is required at install time).
class Miru < Formula
  desc "Inline review for AI-generated Markdown and HTML, fully local"
  homepage "https://github.com/22mb/miru"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/2026.10.25/miru-macos-arm64"
      sha256 "8d6b9700acdc6cb926ec69562d8c509b2d1876a752cd7c4bce3c5a2e07da6be8"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/2026.10.25/miru-macos-x64"
      sha256 "95c8ce66cb1324512876159584798c651f06cd21e493f6e94740c8a4c6d2c0a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/2026.10.25/miru-linux-arm64"
      sha256 "b4aaab17c7649aab3a271541df918e3ab8b929bc60b79b977c79e6bae54c1211"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/2026.10.25/miru-linux-x64"
      sha256 "119a5e33feb1b7aca56ff03a961ff1f3ce8256898d849134d2a8f60cc60129d2"
    end
  end

  def install
    bin.install Dir["miru-*"].first => "miru"
  end

  test do
    # miru prints a usage line to stderr and exits 1 when invoked with no/invalid args.
    assert_match "usage", shell_output("#{bin}/miru 2>&1", 1)
  end
end
