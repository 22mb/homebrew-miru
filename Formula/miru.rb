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
  version "2026.7.26.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "72e2c6da76934b4ec32d71108cf92db07ea0e71af1378968dc4ced228cd64a55"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "8c998f08709f799be636ce9149b4713c9645b73663a7fca263686a0ac9a13426"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "417e10898e4482cb15176a2a5f7976b5f2c0816d1b74f8fbb5c0d3094e27d79e"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "8299d9daed06b54389cd52ed4d2c682081a5d0e94cebf946e5c42470df5233ca"
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
