class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.35/quark-darwin-arm64.tar.gz"
      sha256 "106599cf63ef616d1079459714521d1fefcf536aacaf9765d7bb26df9eb9222b"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.35/quark-darwin-amd64.tar.gz"
      sha256 "0ce037bc502647ff2c8d5d768ab8f4bf419551dccd1d75bbd1cb4fc84fa002b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.35/quark-linux-arm64.tar.gz"
      sha256 "16cc9f7e16a97b82d1f14f4c765ed74ec1a939926d702cddb4c30bd98720cc79"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.35/quark-linux-amd64.tar.gz"
      sha256 "dd8be8a422c896d3960c6cfbce33c2df3866d272675629dfa74b473edd6f4b9a"
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
