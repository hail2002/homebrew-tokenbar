cask "tokenbar" do
  version "2.0.5"
  sha256 "644125ea93fee93cbfed67213bcc0fef019d7911e982ddb650febf8deaa40193"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "TokenBar.app"

  zap trash: [
    "~/Library/Preferences/com.tokenbar.app.plist",
    "~/Library/Application Support/TokenBar",
  ]
end
