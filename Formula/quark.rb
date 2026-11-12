class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-darwin-arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-darwin-amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-linux-arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-linux-amd64.tar.gz"
      sha256 ""
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
