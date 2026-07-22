cask "tokenbar" do
  version "2.5.7"
  sha256 "5ce74ca4154406a5dc5dd439a53a31a87142f5f3e0b5d759bdc949cf31925b57"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

  depends_on macos: :sonoma

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
