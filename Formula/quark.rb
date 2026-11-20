class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.14/quark-darwin-arm64.tar.gz"
      sha256 "46c3de9086a0b57ec275f370305f72eb00d83f95d5ac3c4d4a90d7bcc57e5819"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.14/quark-darwin-amd64.tar.gz"
      sha256 "ddc6856b1d07dae7b8c0719f09129b79bda8ab4f2e8f2fe51aeab8da37830f11"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.14/quark-linux-arm64.tar.gz"
      sha256 "f39dad6c9e3a7812beae4277c5bfc26d7ffd3c2bbb2cdad524cadcd35fc08c0e"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.14/quark-linux-amd64.tar.gz"
      sha256 "9402c66ca88c348b43ea737b611597d9a2c05006c929da8f4584139e0c1e807e"
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
