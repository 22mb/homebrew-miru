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
  version "2026.7.26.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "6ba7decae3c7197e8f7d9b4e8702b8593e4e394e6d4e1ce2f40a45405039f075"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "0508dd435c56013ec5e4e7137106a97cf7d7637b97a39f6f340a46cd0c1d2030"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "afda48de1bab962283b895d822f8766ef2e60497143592314491dde35d2fe1e7"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "375bccf7bcf26771955fccb3c39bbd7ab51eb3da37fb917d8573e0ff6a693354"
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
