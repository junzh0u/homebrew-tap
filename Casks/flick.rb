cask "flick" do
  version "0.1.0"
  sha256 "79c12319ae2edac71ec38c6459513ae5fc599700b1ee16dd6d557ac1cff0753c"

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
