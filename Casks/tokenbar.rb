cask "tokenbar" do
  version "2.1.3"
  sha256 "22789e77d2a7e117fdf7943e06292c891c1ed550f67d206f54bf88d83b0ca3cc"

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
