cask "oncue" do
  version "4.7"
  sha256 "a1554b4c62ac06b7d6ac856c3c4c68d5f11bbb7a906da251d631971c3a6a321d"

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
