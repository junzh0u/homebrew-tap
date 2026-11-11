cask "rex" do
  version "0.1.0,1925"
  sha256 "f2e6c4b51f57fa6bc4123b94ef9dd05f8fa977e5383937178caa7464155a4279"

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
