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
  license "MIT"
  version "2026.6.28"

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "951f41d444511fa5f9504c9be25814235d78ceaa34be0daf4500aeb99c65d368"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "d26abda56394c296045e46b110ed770456d45cc77d7072db987e57371e0a96cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "03c6f537a7ed5d075060c9bc34a88dfce4ffbc87a6204d4c6d4471d2429ecc43"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "a7b35660080a9003aa726f9f84352ad747e49e7e0633a4ca9c9475217b8c8d4d"
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
