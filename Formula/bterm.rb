# bterm Homebrew formula (D2). Installs the FULL CLI suite — bterm (CLI),
# bterm-serverd (daemon), bterm-login, term-tui — from the binaries-only
# releases repo, so installing the TUI always installs the daemon (D4).
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release
# (rewrites `version`, urls and sha256s from the release's SHA256SUMS).
class Bterm < Formula
  desc "Remote-controlled terminal — daemon, CLI and TUI"
  homepage "https://bterm.dev"
  version "0.3.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "859a26ef3bda088bbc045994b4cf77a783659cd8a5e17530879248b52dcee341"
    end
    on_intel do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cd9c3e612449914692d99138df0cd1d05883c95d24ec6ff2bc1c0d70000b4608"
    end
  end

  def install
    bin.install "bterm", "bterm-serverd", "bterm-login", "term-tui"
  end

  def caveats
    <<~EOS
      Link this machine to your bterm account:
        bterm login --relay https://relay.bterm.dev
      Then start the daemon:
        bterm daemon
      Manage your terminals from anywhere at https://app.bterm.dev
    EOS
  end

  test do
    assert_match "bterm", shell_output("#{bin}/bterm version")
  end
end
