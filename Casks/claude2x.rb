cask "claude2x" do
  version "2.0.0"
  sha256 "3cf55a2db7920cb86876b0a7fe81c811a6d05740847d5a77feeb6cc3caf422d3"

  url "https://github.com/swidaryanto/claude2x-menubar/releases/download/v#{version}/Claude2x.dmg"
  name "Claude 2x"
  desc "Menubar app showing when you're in a Claude Pro 2x usage window"
  homepage "https://github.com/swidaryanto/claude2x-menubar"

  app "Claude2x.app"

  zap trash: [
    "~/Library/LaunchAgents/com.claude2x.app.plist",
  ]
end
