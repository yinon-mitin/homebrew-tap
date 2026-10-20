cask "quickpeek" do
  version "0.7.1"
  sha256 "a5f0bb7e586724c2054ec8d569de3910ad3d5d82855ceee91797c5612e4b85b8"

  url "https://github.com/yinon-mitin/QuickPeek/releases/download/v#{version}/QuickPeek-#{version}.zip"
  name "QuickPeek"
  desc "Quick Look previews and file details for formats the system cannot preview"
  homepage "https://github.com/yinon-mitin/QuickPeek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

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
