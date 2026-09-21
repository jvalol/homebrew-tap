cask "oncue" do
  version "4.5.2"
  sha256 "dcffd3bb6502adc6c9a5ac954e9aaf9aa548ed94c97a5f5112f2c72b5291ddf7"

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
