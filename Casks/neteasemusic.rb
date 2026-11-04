cask "neteasemusic" do
  version "3.1.14,3459"
  sha256 "44f49fdd04806d48c9291bbc036b656459ccd6846eb25fc273ca3ae817581f5d"

  url "https://d1.music.126.net/dmusic/NeteaseCloudMusic_Music_official_#{version.csv.join(".")}.dmg",
      user_agent: :fake
  name "NetEase cloud music"
  name "网易云音乐"
  desc "Music streaming platform"
  homepage "https://music.163.com/"

  livecheck do
    url "https://music.163.com/api/mac/package/download/latest?arch=arm64&productName=music"
    strategy :json do |json|
      version = json.dig("data", "appVer")
      build = json.dig("data", "buildVer")
      next if version.blank? || build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos
  # On macOS 27, hdiutil cancels mounting this quarantined DMG ("There may be a
  # problem with this disk image"), so homebrew/cask's neteasemusic fails to
  # install (Homebrew/brew#23401). Stage the DMG unmounted and mount it with
  # diskutil, which accepts it. preflight_steps can't run commands, hence the
  # deprecated preflight
  container type: :naked

  app "NeteaseMusic.app"

  preflight do
    dmg = Dir["#{staged_path}/*.dmg"].first
    mount_point = "#{staged_path}/.mount"
    system_command "/usr/sbin/diskutil",
                   args:         ["image", "attach", "--readOnly", "--nobrowse", "--mountPoint", mount_point, dmg],
                   must_succeed: true
    begin
      system_command "/usr/bin/ditto",
                     args:         ["#{mount_point}/NeteaseMusic.app", "#{staged_path}/NeteaseMusic.app"],
                     must_succeed: true
    ensure
      system_command "/usr/sbin/diskutil", args: ["unmount", "force", mount_point]
    end
    FileUtils.rm dmg
  end

  uninstall quit: "com.netease.163music"

  zap trash: [
    "~/Library/Application Support/com.netease.163music",
    "~/Library/Caches/com.netease.163music",
    "~/Library/Containers/com.netease.163music",
    "~/Library/Cookies/com.netease.163music.binarycookies",
    "~/Library/HTTPStorages/com.netease.163music",
    "~/Library/Preferences/com.netease.163music.plist",
    "~/Library/Saved Application State/com.netease.163music.savedState",
    "~/Library/WebKit/com.netease.163music",
  ]
end
