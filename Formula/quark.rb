class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.19/quark-darwin-arm64.tar.gz"
      sha256 "9322b8babceefd6a85347d3684760a19e583a9332941fe010a0842899d8f1c3c"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.19/quark-darwin-amd64.tar.gz"
      sha256 "a34a72213844746f87154f5453758249555ee1337886d63e46a36ee8cd7aaf74"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.19/quark-linux-arm64.tar.gz"
      sha256 "6411668aafbd52c56aa9ba1cc17caf37d634365d5af0a2fe9da1767902a1e47b"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.19/quark-linux-amd64.tar.gz"
      sha256 "632d8be2e154b5de1d6985e0f449200ae5a0c7db84486f9b4a2743ffb7147fd3"
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
