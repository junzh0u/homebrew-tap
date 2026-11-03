cask "rex" do
  version "0.1.0,1758"
  sha256 "179c2c5707422f676360a2ebb264fd8189ef5e9ca9895140863451ec7ddb3d29"

  url "https://blob.superlogical.com/public/rex-app/preview/Rex-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Rex"
  desc "Terminal multiplexer for people and agents"
  homepage "https://www.superlogical.com/rex"

  livecheck do
    url "https://blob.superlogical.com/public/rex-app/preview/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Rex Beta.app"

  zap trash: [
    "~/Library/Application Support/com.superlogical.rex",
    "~/Library/Application Support/rex",
    "~/Library/Caches/com.superlogical.rex",
    "~/Library/HTTPStorages/com.superlogical.rex",
    "~/Library/Preferences/com.superlogical.rex.plist",
  ]
end
