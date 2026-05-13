# Homebrew tap for OpenPi

Install OpenPi with Homebrew:

```sh
brew tap heyhuynhgiabuu/openpi
brew install --cask openpi
```

Upgrade OpenPi:

```sh
brew update
brew upgrade --cask openpi
```

OpenPi beta builds are currently unsigned. Homebrew handles download/install/upgrade, but macOS may still quarantine unsigned apps. If macOS blocks first launch, remove quarantine manually:

```sh
xattr -rd com.apple.quarantine /Applications/OpenPi.app
```

Fully avoiding Gatekeeper/quarantine prompts requires Developer ID signing and notarization.

OpenPi releases: <https://github.com/heyhuynhgiabuu/openpi/releases>
