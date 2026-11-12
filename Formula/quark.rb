class Quark < Formula
  desc "Quark - A fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"
  version "1.3.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.34/quark-darwin-arm64.tar.gz"
      sha256 "a1a548e93441d0ab1cb6690b368fee5f111bc727970ea6876b4d0ba91357aba0"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.34/quark-darwin-amd64.tar.gz"
      sha256 "ba18f34b5fb1162de747b53afea436b9067dbcb85423f6d46034d29aea465837"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.34/quark-linux-arm64.tar.gz"
      sha256 "9b6b06283cef5a8990859977585b3880a0637837744adbc00c2d99b83c0cdede"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.34/quark-linux-amd64.tar.gz"
      sha256 "1e61b84fd7b95710d3421ab00b1288b700e5deeb24cbee8ced103460b6693cb2"
    end
  end

  def install
    bin.install "quark"
    bash_completion.install "completions/quark.bash" => "quark"
    zsh_completion.install "completions/_quark"
    fish_completion.install "completions/quark.fish"
  end

  test do
    system "#{bin}/quark", "--version"
  end
end
