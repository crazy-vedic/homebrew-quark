class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.2/quark-darwin-arm64.tar.gz"
      sha256 "409fc4c02eb866b1b5a16e85bc07a4f1351a335a6414be49ca49eab068209800"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.2/quark-darwin-amd64.tar.gz"
      sha256 "c7186e501163e3cfa790581174124c7ff70b7a4a132a70276e55246af4ca4af5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.2/quark-linux-arm64.tar.gz"
      sha256 "b1fd209591cf91620dd0f763b1fe99a1b6b5de3c773b3edc77a85675cebd835c"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.2/quark-linux-amd64.tar.gz"
      sha256 "ea36b34448aaab972b5439eb74715486d14904fa106c0ce35b63eb076bba6af5"
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
