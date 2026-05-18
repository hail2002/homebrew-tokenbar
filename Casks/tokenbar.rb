cask "tokenbar" do
  version "2.4.0"
  sha256 "d447b18c7328f895577730568a9d9054410fe78ad0293232e1e54a5afa1cd50e"

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
