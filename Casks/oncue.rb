cask "oncue" do
  version "4.14"
  sha256 "3be81be965e315c7ae365b5e1a8ca6dcfe996649eb3e9800e0f5339fe93e5a19"

  url "https://oncue.jva.lol/downloads/OnCue-#{version}.zip"
  name "OnCue"
  desc "Menu bar recorder that starts when the camera or microphone sees activity"
  homepage "https://oncue.jva.lol/"

  livecheck do
    url :homepage
    regex(%r{href=["']?downloads/OnCue[._-]v?(\d+(?:\.\d+)+)\.zip}i)
  end

  depends_on macos: :sonoma

  app "OnCue.app"

  # Both bundle IDs on purpose. The app shipped as lol.jva.oncue through 4.7.1 and moves to
  # com.eggdevil.oncue after it, so an upgrade leaves a container under each. Naming only the
  # current one would quit nothing on an older copy and leave the old container behind forever.
  uninstall quit: [
    "com.eggdevil.oncue",
    "lol.jva.oncue",
  ]

  # Recordings in ~/Movies/OnCue (or wherever the user pointed it) are theirs and are left alone.
  zap trash: [
    "~/Library/Application Scripts/com.eggdevil.oncue",
    "~/Library/Application Scripts/lol.jva.oncue",
    "~/Library/Containers/com.eggdevil.oncue",
    "~/Library/Containers/lol.jva.oncue",
  ]

  # brew prints this on install and upgrade, in the terminal the person is already looking at.
  # It is the only channel that reaches a brew user at the moment of the 4.8 update, which changed
  # the bundle ID and so left the old login item registered and dead (oncue spec 0037).
  caveats <<~EOS
    Updating from 4.7.1 or earlier: OnCue will not open at login until you
    remove the old OnCue row in System Settings > General > Login Items and
    turn Open OnCue at Login back on in OnCue's Preferences. Other settings
    are back at their defaults; recordings are untouched.
  EOS
end
