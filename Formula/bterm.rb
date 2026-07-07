# bterm Homebrew formula. Installs the CLI suite — bterm (CLI/TUI launcher),
# bterm-daemon-v13 (the v13 daemon), term-tui (the UI bterm execs) — from the
# binaries-only releases repo, so installing the CLI always installs the daemon.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release
# (rewrites `version`, urls and sha256s from the release's SHA256SUMS).
class Bterm < Formula
  desc "Remote-controlled terminal — daemon, CLI and TUI"
  homepage "https://bterm.dev"
  version "0.6.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6a4df12cfd6765cab4b1b2514ca34f7bf8574241ef3d74eeb35e2142e25ebb6a"
    end
    on_intel do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "aac3ad9b333ee5cd827587d4505d6bd07b23db224d18c4454a49e9ea0b2ff6b2"
    end
  end

  def install
    bin.install "bterm", "bterm-daemon-v13", "term-tui"
  end

  def caveats
    <<~EOS
      Link this machine to your bterm account:
        bterm login
      Then start the daemon (the CLI/app also auto-start it):
        bterm daemon start
      Manage your terminals from anywhere at https://app.bterm.dev
    EOS
  end

  test do
    assert_match "bterm", shell_output("#{bin}/bterm version")
  end
end
