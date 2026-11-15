class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.43/quark-darwin-arm64.tar.gz"
      sha256 "7fb25c86b26e37b74ab3f8444f4fae0716e9122ceb74949769b7c757801b5af6"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.43/quark-darwin-amd64.tar.gz"
      sha256 "12a6ad676e89e2ceac0b10a5df8346cc1c6b18440f21b60c8c0daf84cb53276a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.43/quark-linux-arm64.tar.gz"
      sha256 "bcc9c6237ac7f00ac3d1589504fa2d298d7f73d70292db85d3fef9912bec009b"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.43/quark-linux-amd64.tar.gz"
      sha256 "524cefe6b5bd1fc4fdc37900893a82acee46891fadd1d4ffecdf8351e42f36a5"
    end
  end

  def install
    bin.install "quark"
    bash_completion.install "completions/quark.bash" => "quark"
    zsh_completion.install "completions/_quark"
    fish_completion.install "completions/quark.fish"
  end

  test do
    system bin/"quark", "--version"
  end
end
