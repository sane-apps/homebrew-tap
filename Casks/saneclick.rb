cask "saneclick" do
  version "1.3.3"
  sha256 "d93f97c43365c0decc704ca009a7d18fb3543c52b45ad2edeefe1ccb6a932897"

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
