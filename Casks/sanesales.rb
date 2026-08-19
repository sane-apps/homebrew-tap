cask "sanesales" do
  version "1.3.12"
  sha256 "59d8a412c82f1006adbc0b6e6a2ff3e8eadae0b264e6abb27490a0ee41acedf4"

  url "https://dist.sanesales.com/updates/SaneSales-#{version}.zip"
  name "SaneSales"
  desc "Indie sales dashboard with Basic and Pro modes"
  homepage "https://sanesales.com"

  auto_updates true
  depends_on macos: :sonoma

  app "SaneSales.app"

  caveats <<~EOS
    Already have SaneSales installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanesales

    SaneSales updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneSales",
    "~/Library/Preferences/com.sanesales.app.plist",
    "~/Library/Caches/com.sanesales.app",
  ]

  livecheck do
    url "https://sanesales.com/appcast.xml"
    strategy :sparkle
  end
end
