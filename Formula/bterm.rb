# bterm Homebrew formula. Installs the CLI suite — bterm (CLI/TUI launcher),
# bterm-daemon-v13 (the v13 daemon), term-tui (the UI bterm execs) — from the
# binaries-only releases repo, so installing the CLI always installs the daemon.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release
# (rewrites `version`, urls and sha256s from the release's SHA256SUMS).
class Bterm < Formula
  desc "Remote-controlled terminal — daemon, CLI and TUI"
  homepage "https://bterm.dev"
  version "0.9.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1c153be16a873a8619eda0a5f8ed3b6cbb592a4133961597fbf6cc3fa5852bc3"
    end
    on_intel do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ba3ab7c7e696a70c72967ece5826a67b492fad7422d6edefc6ebe8285ec1a798"
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
