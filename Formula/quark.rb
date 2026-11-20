class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.11/quark-darwin-arm64.tar.gz"
      sha256 "60c7417d3c17f030e90d68ad4d7f78de31a632090b2d5622b8354f227c4c0bd8"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.11/quark-darwin-amd64.tar.gz"
      sha256 "d40fe570224964fb05921463bb8544c59ba37ef3e60544f53303570ce0b46f03"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.11/quark-linux-arm64.tar.gz"
      sha256 "95c1b5c9253fe3bdf96a2a74ab009506c92d3450f5e66d10e1babd88f65cd518"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.11/quark-linux-amd64.tar.gz"
      sha256 "12dafce8ee7b58bfc7b1e95e3269175a707a4fcfce05db75e029e915c9136aa5"
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
