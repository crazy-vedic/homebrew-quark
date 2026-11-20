class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.15/quark-darwin-arm64.tar.gz"
      sha256 "a6fe04cf75c85337437d14d388c874739800ac7a07afed8ad29d1d4e504d0328"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.15/quark-darwin-amd64.tar.gz"
      sha256 "2d9a3872ab68db109f9b3a798df11ea3579e744a3bb3fb09559bc2f98fe6c45a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.15/quark-linux-arm64.tar.gz"
      sha256 "d601234254453a637cbcb99b39ff4c556e61a14137e5c46c8a73667d8476fe0d"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.15/quark-linux-amd64.tar.gz"
      sha256 "d80b4b2e766a7067cf58cbce7d6d69c14c297ee6c6e883bf682e074e6facc52f"
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
