class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.0/quark-darwin-arm64.tar.gz"
      sha256 "181294514c7c64ec01e3c2db1ade74ad58c00768922ec2ad44f50e4ee0b6b31e"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.0/quark-darwin-amd64.tar.gz"
      sha256 "1f393fd69da08abf6aa1fa3fdc63f4d2e58f93258b40856b5e8b9945d3b13a53"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.0/quark-linux-arm64.tar.gz"
      sha256 "5fda2727994e23a5151b58c2fc2d5da396ffa0ef63f85ea71d8f58f7053070aa"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.0/quark-linux-amd64.tar.gz"
      sha256 "73c64bb7d103d1091e56489491852f5a448ecfd08bd678db0da46e85ec262f84"
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
