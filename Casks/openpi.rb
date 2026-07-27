cask "openpi" do
  version "0.2.5"

  on_arm do
    sha256 "a775c7b22896f0e9e10b70728a2896e0696f7919e2727f732444afb5a9ae9a8d"

    url "https://github.com/heyhuynhgiabuu/openpi/releases/download/v#{version}/OpenPi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1afb478026de4b7d9bea1441fa82dfbc236e836743c4d57839ec7bedea8e145e"

    url "https://github.com/heyhuynhgiabuu/openpi/releases/download/v#{version}/OpenPi-#{version}-x64.dmg"
  end

  name "OpenPi"
  desc "Desktop workbench for the Pi coding agent"
  homepage "https://github.com/heyhuynhgiabuu/openpi"

  livecheck do
    url :url
    strategy :github_latest
  end

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
