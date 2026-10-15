cask "quickpeek" do
  version "0.6.0"
  sha256 "a421da74d2563e9197af90c20af7d3ef5887e3c96a94afb9a0a9a70d7609c768"

  url "https://github.com/yinon-mitin/QuickPeek/releases/download/v#{version}/QuickPeek-#{version}.zip"
  name "QuickPeek"
  desc "Quick Look previews and file details for files macOS leaves blank"
  homepage "https://github.com/yinon-mitin/QuickPeek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "QuickPeek.app"

  zap trash: [
    "~/Library/Containers/io.github.yinon-mitin.QuickPeek.FinderSync",
    "~/Library/Containers/io.github.yinon-mitin.QuickPeek.Preview",
    "~/Library/Containers/io.github.yinon-mitin.QuickPeek.Thumbnail",
    "~/Library/Preferences/io.github.yinon-mitin.QuickPeek.plist",
  ]

  caveats <<~EOS
    QuickPeek is signed ad hoc, not notarized by Apple. On first launch macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway", then open QuickPeek
    again to register its Quick Look, thumbnail and Finder extensions.
  EOS
end
