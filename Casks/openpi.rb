cask "openpi" do
  version "0.2.0"
  sha256 "54d7e6c99c9ddb5d7543015a509fa116c6f04ba3ec179fee08ef289368e28eeb"

  url "https://github.com/heyhuynhgiabuu/openpi/releases/download/v#{version}/OpenPi-#{version}-arm64.dmg"
  name "OpenPi"
  desc "Desktop workbench for the Pi coding agent"
  homepage "https://github.com/heyhuynhgiabuu/openpi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "OpenPi.app"

  zap trash: [
    "~/Library/Application Support/OpenPi",
    "~/Library/Application Support/openpi",
    "~/Library/Logs/OpenPi",
    "~/Library/Preferences/dev.openpi.app.plist",
    "~/Library/Saved Application State/dev.openpi.app.savedState",
  ]

  caveats <<~EOS
    OpenPi beta builds are currently unsigned, so macOS may block first launch.
    If blocked, remove quarantine manually:
      xattr -rd com.apple.quarantine /Applications/OpenPi.app
  EOS
end
