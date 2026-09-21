cask "oncue" do
  version "4.6"
  sha256 "fc11544dd0a6dfb0fd364d9b561ac12c228577729aa7502c33e150090b872889"

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
