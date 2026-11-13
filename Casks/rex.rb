cask "rex" do
  version "0.1.0,1956"
  sha256 "1f24601f4963e3577edf836780b21d0505e227ae981d5138659fc7f68b8fba6e"

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
