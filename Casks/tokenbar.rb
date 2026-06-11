cask "tokenbar" do
  version "2.5.3"
  sha256 "870adc4942836ba2f5fbce29e4b755e1d53a3fd80a72092e15d039c7645f4efe"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

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
