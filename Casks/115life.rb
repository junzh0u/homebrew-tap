cask "115life" do
  version "37.3.2"
  sha256 "b9c72e04357f1bac0753f0dd162c9e751e9522987578eb864ebc51db01ca1fd1"

  url "https://down.115.com/client/115pc/mac/115Life_#{version}_arm64.dmg"
  name "115生活"
  desc "Cloud storage and offline download client for 115.com"
  homepage "https://115.com/"

  # 115 publishes only versioned DMGs and no feed for the macOS client
  livecheck do
    skip "No version information available"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "115生活.app"

  zap trash: [
    "~/Library/Application Support/Life115",
    "~/Library/Caches/com.115.life.mac",
    "~/Library/Containers/com.115.life.mac.UploadQuickAction",
    "~/Library/HTTPStorages/com.115.life.mac",
    "~/Library/Preferences/com.115.life.mac.plist",
  ]
end
