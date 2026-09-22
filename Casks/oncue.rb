cask "oncue" do
  version "4.7.1"
  sha256 "4e6b9d82bad618b9761d096f4a027f84d8460ef18a9dc69d7e34fede81bb82a1"

  url "https://oncue-web.netlify.app/downloads/OnCue-#{version}.zip"
  name "OnCue"
  desc "Menu bar recorder that starts when the camera or microphone sees activity"
  homepage "https://oncue-web.netlify.app/"

  livecheck do
    url :homepage
    regex(%r{href=["']?downloads/OnCue[._-]v?(\d+(?:\.\d+)+)\.zip}i)
  end

  depends_on macos: :sonoma

  app "OnCue.app"

  uninstall quit: "lol.jva.oncue"

  # Recordings in ~/Movies/OnCue (or wherever the user pointed it) are theirs and are left alone.
  zap trash: [
    "~/Library/Application Scripts/lol.jva.oncue",
    "~/Library/Containers/lol.jva.oncue",
  ]
end
