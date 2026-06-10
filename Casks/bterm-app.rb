# bterm desktop app (term-app GUI) as a Homebrew Cask. The .app bundles
# the daemon, so a GUI-only install still works offline; `brew install
# bterm-dev/bterm/bterm` (the formula) remains the CLI/TUI suite.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release.
cask "bterm-app" do
  version "0.3.2"
  sha256 "f357c4fa88d5caa1bbfbbf6eae2c8a9695bd5295b35346f8a73bd56bc14fc74c"

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
