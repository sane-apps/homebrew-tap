cask "sanebar" do
  version "1.5.0"
  sha256 "f3478e6dbe19d367ab1acc2cebf659d7fd4d2df2b76b81ea3752a4f919304fdd"

  url "https://dist.sanebar.com/updates/SaneBar-#{version}.zip"
  name "SaneBar"
  desc "Tame your macOS menu bar — hide, organize, and search your icons"
  homepage "https://sanebar.com"

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "SaneBar.app"

  zap trash: [
    "~/Library/Application Support/SaneBar",
    "~/Library/Preferences/com.sanebar.app.plist",
    "~/Library/Caches/com.sanebar.app",
  ]

  livecheck do
    url "https://sanebar.com/appcast.xml"
    strategy :sparkle
  end
end
