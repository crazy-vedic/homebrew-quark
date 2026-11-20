class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.22/quark-darwin-arm64.tar.gz"
      sha256 "644708706704163761aec42e86c96b46924e333b336b384c1094f131382fbb12"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.22/quark-darwin-amd64.tar.gz"
      sha256 "ba9d0acc8da10655c466e27245821b2e2a18315e6699fb666e00e67135ad0ab7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.22/quark-linux-arm64.tar.gz"
      sha256 "f72ee9d2632e221bc0b5cbe749614a44064957ecd7b58f8b77841e9c565a8b5c"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.22/quark-linux-amd64.tar.gz"
      sha256 "fd5a2f2414fd6ef4316a738b6d4f14b75ef44c88f696e328b8856cd62c70c26c"
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
