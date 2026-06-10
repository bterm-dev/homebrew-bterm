# bterm desktop app (term-app GUI) as a Homebrew Cask. The .app bundles
# the daemon, so a GUI-only install still works offline; `brew install
# bterm-dev/bterm/bterm` (the formula) remains the CLI/TUI suite.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release.
cask "bterm-app" do
  version "0.3.1"
  sha256 "2bb58c8a858b2bfbdc0e883221be3eb5dc683ff24f36f9763c00892c4e12ede8"

  url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-#{version}-macos-universal.dmg"
  name "bterm"
  desc "Remote-controlled terminal — desktop app"
  homepage "https://bterm.dev"

  app "bterm.app"

  caveats <<~EOS
    The app is ad-hoc signed (not notarized). If macOS quarantines it:
      xattr -dr com.apple.quarantine /Applications/bterm.app
    Link this machine for remote control with:
      bterm login
  EOS
end
