# bterm desktop app (term-app GUI) as a Homebrew Cask. The .app bundles
# the daemon, so a GUI-only install still works offline; `brew install
# bterm-dev/bterm/bterm` (the formula) remains the CLI/TUI suite.
#
# Updated by bterm-core/scripts/update-brew-formula.sh on each release.
cask "bterm-app" do
  version "0.3.6"
  sha256 "745e98ea8675bd64418926f01173ef89d8322b8775fe6c3babdaf9b9803facfc"

  url "https://github.com/bterm-dev/bterm-releases/releases/download/v#{version}/bterm-#{version}-macos-universal.dmg"
  name "bterm"
  desc "Remote-controlled terminal — desktop app"
  homepage "https://bterm.dev"

  app "bterm.app"

  # The .app is ad-hoc signed (no Apple Developer ID / notarization yet),
  # so Gatekeeper refuses to open it while the quarantine xattr from the
  # download is present. Strip it on install. NOTE: recent macOS dropped
  # `xattr -r`, so walk the bundle with find instead.
  postflight do
    system_command "/bin/sh",
                   args: ["-c",
                          "find '#{appdir}/bterm.app' -exec xattr -d com.apple.quarantine {} \\; 2>/dev/null; true"],
                   sudo: false
  end

  caveats <<~EOS
    The app is ad-hoc signed (not notarized). If macOS still blocks it:
      find /Applications/bterm.app -exec xattr -d com.apple.quarantine {} \\;
    Link this machine for remote control with:
      bterm login
  EOS
end
