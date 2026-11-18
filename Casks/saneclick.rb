cask "saneclick" do
  version "1.3.6"
  sha256 "7edaa8599d3428fb91e924c3b7b0f33f7603ae1a53c865fed7f4780ec135ef69"

  url "https://dist.saneclick.com/updates/SaneClick-#{version}.zip"
  name "SaneClick"
  desc "Finder right-click actions for files and folders"
  homepage "https://saneclick.com"

  auto_updates true
  depends_on macos: :sonoma

  app "SaneClick.app"

  caveats <<~EOS
    Already have SaneClick installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/saneclick

    SaneClick updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneClick",
    "~/Library/Preferences/com.saneclick.SaneClick.plist",
    "~/Library/Caches/com.saneclick.SaneClick",
  ]

  livecheck do
    url "https://saneclick.com/appcast.xml"
    strategy :sparkle
  end
end
