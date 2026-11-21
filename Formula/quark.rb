class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.28/quark-darwin-arm64.tar.gz"
      sha256 "302ba93d61ba5f5a630db967db3e149cd706972dd4cea9ac92a632cb8eadde73"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.28/quark-darwin-amd64.tar.gz"
      sha256 "34cbb712049cefd3ee540ad7be12108a8eb69de3abf7f5c1dbf6447f5cf08492"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.28/quark-linux-arm64.tar.gz"
      sha256 "bc93f10134244b55426928751c5912dc48556738554f5a9b6dd8fff0162a5078"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.28/quark-linux-amd64.tar.gz"
      sha256 "e9aa30fb20824cff60ad778c40e6b775d32d31a77b582dd8ff2a7af6b5ab42f4"
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
