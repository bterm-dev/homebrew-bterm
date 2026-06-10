# bterm Homebrew formula (D2). Installs the FULL CLI suite — bterm (CLI),
# bterm-serverd (daemon), bterm-login, term-tui — from the binaries-only
# releases repo, so installing the TUI always installs the daemon (D4).
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release
# (rewrites `version`, urls and sha256s from the release's SHA256SUMS).
class Bterm < Formula
  desc "Remote-controlled terminal — daemon, CLI and TUI"
  homepage "https://bterm.dev"
  version "0.3.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c7f06cf789a976ed5abd7540f8d79010bb8cb9dd695cf2c99ee7cc9cf3078e93"
    end
    on_intel do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "82f357fdf0a58dac0602e220e3174d4a23fe75c0e8ca1f6fb1ed156c7dbfed76"
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
