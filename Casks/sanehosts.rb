cask "sanehosts" do
  version "1.1.25"
  sha256 "df61c08e916e41ce2eb4a30a144b00c6027d6f9e85492b86ef7fb6138175b451"

  url "https://dist.sanehosts.com/updates/SaneHosts-#{version}.zip"
  name "SaneHosts"
  desc "Host-based blocker with Basic and Pro profiles"
  homepage "https://sanehosts.com"

  auto_updates true
  depends_on macos: :sonoma

  app "SaneHosts.app"

  caveats <<~EOS
    Already have SaneHosts installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanehosts

    SaneHosts updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneHosts",
    "~/Library/Preferences/com.mrsane.SaneHosts.plist",
    "~/Library/Caches/com.mrsane.SaneHosts",
  ]

  livecheck do
    url "https://sanehosts.com/appcast.xml"
    strategy :sparkle
  end
end
