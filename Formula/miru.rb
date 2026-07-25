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
  version "2026.7.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "667d8f86c07c68c9242a2c4d6155ff21bc1de8b8fbcc007ebae63c7f962af85e"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "d48666d6963e86240715290b12bf8a29bb7e4808b7bc115111dbe93bd2be095b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "7ae61534e1763f0a4921a13427120a25c2757da1fa117b742630c728386e9612"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "27f83e62d82f9d7573de258cb6ac190317fe6888119869873dc46e26a9d4aa1d"
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
