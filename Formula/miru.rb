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
      url "https://github.com/22mb/miru/releases/download/2026.9.15/miru-macos-arm64"
      sha256 "11ee983208f4d042d8c3e6e456b9aa866645b1f7a48a3edb743948f5a972dd80"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/2026.9.15/miru-macos-x64"
      sha256 "74a6ddb4c6c6464b7a406f58a57f811fb1b3afbabc85356b0937ac8771f04140"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/2026.9.15/miru-linux-arm64"
      sha256 "d32362c05131b649f3945073c7156a0564e08f5c6f8425a33c5fbbb677d5b94e"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/2026.9.15/miru-linux-x64"
      sha256 "ed7a2321a16b79c7fae3362633e5d9fccdf59a862fad3d219cabe50cea431e82"
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
