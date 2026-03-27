cask "tokenbar" do
  version "2.0.3"
  sha256 "e6993140175afc1765ac3b0df510f16db98f4e17936a9eb5c7dd2c1cd46a4dba"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "TokenBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.tokenbar.app.plist",
    "~/Library/Application Support/TokenBar",
  ]
end
