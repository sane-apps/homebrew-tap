cask "sanebar" do
  version "2.1.72"
  sha256 "fb6672917fd6641c374fe709b70667f9a98d99a09ef34ad16441ab2449819c4a"

  url "https://dist.sanebar.com/updates/SaneBar-#{version}.zip"
  name "SaneBar"
  desc "Tame your macOS menu bar — hide, organize, and search your icons"
  homepage "https://sanebar.com"

  auto_updates true
  depends_on macos: :sequoia

  app "SaneBar.app"

  caveats <<~EOS
    Already have SaneBar installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanebar

    SaneBar updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

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
