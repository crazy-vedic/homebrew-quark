class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.17/quark-darwin-arm64.tar.gz"
      sha256 "2ebf045e4739bfaf6b9dfa90b9218fab4869b602238f79d6f6a855e4d4b469ed"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.17/quark-darwin-amd64.tar.gz"
      sha256 "240f24866a2ba0ad7ed48d41f51cf5902889aac7411b680e22a314e7911424f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.17/quark-linux-arm64.tar.gz"
      sha256 "768dd8174df4a8865fa250962c1d326203b8ebfc1d673b7338c67311e42386dc"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.17/quark-linux-amd64.tar.gz"
      sha256 "35a9fcaa694c5f7a01e32e1db78b82323d3812b662733c6f40031abdd205201a"
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
