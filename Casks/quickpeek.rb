cask "quickpeek" do
  version "0.7.0"
  sha256 "fbffbbd305ecfe53b8772164df80e0561b36b34471da232e58397b9b47080ef6"

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
