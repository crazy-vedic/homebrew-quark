class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.9/quark-darwin-arm64.tar.gz"
      sha256 "e7d2b0f5ba8f382b106d99b688d5ef2c5d207d0685205842669c203aeb8e91bf"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.9/quark-darwin-amd64.tar.gz"
      sha256 "3606195077b5c60b2d058ff96f73548ba56833d3e83614bebb8b3c142454222b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.9/quark-linux-arm64.tar.gz"
      sha256 "95d75561f02ef7609d3332ad45277ce80240fe41a83cc12829059f5fdb24c9d9"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.9/quark-linux-amd64.tar.gz"
      sha256 "6986c0ff5e469e5d19c9b4778e9deb8b4ce595198c12e2fb02a80f75bf4d1bcf"
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
