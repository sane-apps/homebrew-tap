cask "sanehosts" do
  version "1.1.19"
  sha256 "fce0fa62c00be752d04843529c75697ad3f9172fb5eed1d1ac19f219ca1e93e6"

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
