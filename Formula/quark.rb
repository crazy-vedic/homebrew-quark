class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.4/quark-darwin-arm64.tar.gz"
      sha256 "61cb412e74383d3aea1f8ab0e6a7ba93deed2065efdf64fd0c863193a3ecee02"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.4/quark-darwin-amd64.tar.gz"
      sha256 "c89e99a97637fde52ae99d8321537b08fe5cf8cb3ff9411a598d15e3cc78ac0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.4/quark-linux-arm64.tar.gz"
      sha256 "c8dcca3f48617f44ba7739d9b51d21d06b97b9d8f37342199804acad767d1150"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.4/quark-linux-amd64.tar.gz"
      sha256 "269920b5a72c3d7a94a90fac2dfdf2182b98fb6e1e881776a86bbaa3028b3d54"
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
