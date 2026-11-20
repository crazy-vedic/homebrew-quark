class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.10/quark-darwin-arm64.tar.gz"
      sha256 "9c42a1353de3463567b90010f54725a168ed4f03af72424fcfb0f6879aba03f0"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.10/quark-darwin-amd64.tar.gz"
      sha256 "146f1a32daf76abda371f1d9a7f945342ebe15e4f1688eeab8a03f4d3e59d7dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.10/quark-linux-arm64.tar.gz"
      sha256 "3d6cca729ba27686c210d3ca0edc45a8bfd9d2778d2cc4d4927a95782961fcbe"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.10/quark-linux-amd64.tar.gz"
      sha256 "01a2e21a08585b3109803bd92db6e6aa86dfe23f1b2cbe0a22a6a0fb8c874974"
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
