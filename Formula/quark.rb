class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.21/quark-darwin-arm64.tar.gz"
      sha256 "827a3d2458c977b888643201d53c980242b011a14ddff21efcfe906e7a5ce4ce"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.21/quark-darwin-amd64.tar.gz"
      sha256 "1152f86e8821479d7b0de1119aff27734b27132b489bbf4fc0480d114d716414"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.21/quark-linux-arm64.tar.gz"
      sha256 "96299de634ea1b8fb6fb57ceb7fa9f81f36ef9b86a8078f8379c4e226945402a"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.21/quark-linux-amd64.tar.gz"
      sha256 "2a7b8eff39c31bcc18208969be684f98a8a508063094a1ace2e36a620cc084c0"
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
