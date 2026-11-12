class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.37/quark-darwin-arm64.tar.gz"
      sha256 "63730ca53ac7c411d2dc8987728270bcaee0ecfc07131e7e0a76b2135bde2eb1"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.37/quark-darwin-amd64.tar.gz"
      sha256 "ad9e08769dff57777d50d9e73658f549801daea15007bb356c1b5a7625e4f590"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.37/quark-linux-arm64.tar.gz"
      sha256 "68317a3789c3438887bcc7d8892fd2160370b0a80042038c847f70ea4ba4b37f"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.37/quark-linux-amd64.tar.gz"
      sha256 "92151610da497750ad298bfd481278d9ecccb6b5c6ade23bbe4d4a7445724c82"
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
