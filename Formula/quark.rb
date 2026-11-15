class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.45/quark-darwin-arm64.tar.gz"
      sha256 "056c20634eff0a70a87df01866116240cf703f99801fa3ec07aa31a4d9755d40"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.45/quark-darwin-amd64.tar.gz"
      sha256 "b7545a336aba2a14aab5ed91dba6417c125b964f1f6bacc2ff34722ca516ac6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.45/quark-linux-arm64.tar.gz"
      sha256 "344e3db0ddf0d30e514c6cb83d77ea36f6ea972b082b22c99ba640d4d8f076cd"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.45/quark-linux-amd64.tar.gz"
      sha256 "6cf8af8c36412b1fd7238fadd47bfc94ac484ae0755d83b9c548637a124adec4"
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
