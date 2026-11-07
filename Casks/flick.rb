cask "flick" do
  version "0.2.0"
  sha256 "2a4f46e70021bf02c4e36c4ce3892ae1b6e65d82e6090b240c9a659fd6cc3379"

  url "https://github.com/junzh0u/flick/releases/download/v#{version}/Flick-#{version}.zip"
  name "Flick"
  desc "Trackpad gestures that move and tile windows, built for Stage Manager"
  homepage "https://github.com/junzh0u/flick"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Flick.app"

  uninstall quit: "info.junz.flick"

  zap trash: "~/.config/flick"
end
