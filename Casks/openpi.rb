cask "openpi" do
  version "0.1.17"
  sha256 "0a101fb26878d9902e3b612cb62db10589da28a19296a8224b188ee8c71b907e"

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
