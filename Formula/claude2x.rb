class Claude2x < Formula
  desc "macOS menubar app showing Claude Pro 2x usage status"
  homepage "https://github.com/swidaryanto/claude2x-menubar"
  url "https://github.com/swidaryanto/claude2x-menubar/releases/download/v2.1.0/claude2x-source-2.1.0.tar.gz"
  sha256 "6b169f0fc5b18026c7cef2f150e6d330383e5cc9e019250de3ef58d9d4669038"
  version "2.1.0"
  license "MIT"

  def install
    # Install Python dependencies into the formula's libexec
    system "pip3", "install", "--target=#{libexec}/lib", "--quiet", "rumps", "pytz"

    # Install app files
    libexec.install "claude2x.py"
    (libexec/"frames").install Dir["frames/*"]

    # Wrapper script — runs the Python script with the bundled deps
    (bin/"claude2x").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/lib:$PYTHONPATH"
      exec python3 "#{libexec}/claude2x.py" "$@"
    EOS
  end

  service do
    run opt_bin/"claude2x"
    keep_alive false
    run_at_load true
    log_path var/"log/claude2x.log"
    error_log_path var/"log/claude2x.log"
  end

  def caveats
    <<~EOS
      Start Claude 2x (and auto-start at login):
        brew services start swidaryanto/tap/claude2x

      Stop it:
        brew services stop swidaryanto/tap/claude2x
    EOS
  end
end
