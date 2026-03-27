cask "tokenbar" do
  version "2.0.6"
  sha256 "bbabb7b3f9ca4f1980156a345d3e2285b904e22c24d4175223b61f712dbb03dc"

  url "https://github.com/hail2002/tokenbar/releases/download/v#{version}/TokenBar.zip"
  name "Token Bar"
  desc "macOS menubar app for Codex & Claude Code rate limits"
  homepage "https://github.com/hail2002/tokenbar"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "TokenBar.app"

  postflight do
    system_command "/usr/bin/pkill", args: ["-x", "TokenBar"], sudo: false
    system_command "/usr/bin/open", args: ["#{appdir}/TokenBar.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.tokenbar.app.plist",
    "~/Library/Application Support/TokenBar",
  ]
end
