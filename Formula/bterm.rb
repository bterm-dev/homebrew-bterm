# bterm Homebrew formula. Installs the CLI suite — bterm (CLI/TUI launcher),
# bterm-daemon-v13 (the v13 daemon), term-tui (the UI bterm execs) — from the
# binaries-only releases repo, so installing the CLI always installs the daemon.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release
# (rewrites `version`, urls and sha256s from the release's SHA256SUMS).
class Bterm < Formula
  desc "Remote-controlled terminal — daemon, CLI and TUI"
  homepage "https://bterm.dev"
  version "0.6.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9d1a66719becdb7d3a76c3c2fcfaf753d65d778ea53961302d079b2119853867"
    end
    on_intel do
      url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2b810e4400643db3885715577f937b2e95130f3f45e190e12fb2da638ea26749"
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
