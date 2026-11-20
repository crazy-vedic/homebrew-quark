class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.16/quark-darwin-arm64.tar.gz"
      sha256 "af655093e339fd535e19aa9dc202d0bad549bc67786100bd3318ac1551b36450"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.16/quark-darwin-amd64.tar.gz"
      sha256 "6418c9cc044ba09f1c13bd3cd91e9ba51fea08f41f151aea5de4069a3540f4be"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.16/quark-linux-arm64.tar.gz"
      sha256 "0cfde9b8b4a0387af7ee08f82ae610afb9ebad1153daa38aead69378dd2fcc2b"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.16/quark-linux-amd64.tar.gz"
      sha256 "929e8557064512ace790402314a5d60704be5b65ec1f386a988e2ab2cad4878a"
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
