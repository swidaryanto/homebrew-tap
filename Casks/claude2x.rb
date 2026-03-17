cask "claude2x" do
  version "2.0.0"
  sha256 "b6b7aacc4c537251f9ac9be0863cc0c30da210d693300355e2966ee3903b9392"

  url "https://github.com/swidaryanto/claude2x-menubar/releases/download/v#{version}/Claude2x.dmg"
  name "Claude 2x"
  desc "Menubar app showing when you're in a Claude Pro 2x usage window"
  homepage "https://github.com/swidaryanto/claude2x-menubar"

  app "Claude2x.app"

  zap trash: [
    "~/Library/LaunchAgents/com.claude2x.app.plist",
  ]
end
