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
  version "2026.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-arm64"
      sha256 "51875ad07c62472a23b685e1493c6624dc4ebbc91389f1d5d77d8af5aa2d3694"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-macos-x64"
      sha256 "351ab84726f934eaed1865327457e314e77b9b93b1775d25175d6063e7f79029"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-arm64"
      sha256 "b66ddc486eeaf3aa3f841516211d7b6316bbd188c8daf2595b4280de3a755da2"
    end
    on_intel do
      url "https://github.com/22mb/miru/releases/download/#{version}/miru-linux-x64"
      sha256 "ff5fdba8fb96015783aa84e0e8661581364d1773b6f966f87cb6b6743daa82ff"
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
