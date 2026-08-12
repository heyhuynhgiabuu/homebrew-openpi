cask "openpi" do
  version "0.2.6"

  on_arm do
    sha256 "26b073f90c71c4acda5cdbf6a926599031d35bd47af45a2d2eefdc70f84f5918"

    url "https://github.com/heyhuynhgiabuu/openpi/releases/download/v#{version}/OpenPi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ddd92fac6bf525187bf3e46f462a42dbe13433f42fd069f1d8c9828e6122890f"

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
