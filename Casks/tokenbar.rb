cask "tokenbar" do
  version "2.3.0"
  sha256 "a2acebd5b26caa761e1e3c635e78427461227d194ff14c82bd110e2ad1444f68"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "TokenBar.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/TokenBar.app"
    system "pkill", "-x", "TokenBar"
    system "open", "#{appdir}/TokenBar.app"
  end

  zap trash: [
    "~/Library/Preferences/com.tokenbar.app.plist",
    "~/Library/Application Support/TokenBar",
  ]
end
