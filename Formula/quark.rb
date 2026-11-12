class Quark < Formula
  desc "Quark - A fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"
  version "1.3.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.32/quark-darwin-arm64.tar.gz"
      sha256 "79177542be9a485922670b80a15f2425ba5a582fa8dcfe54374e12ca209647ab"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.32/quark-darwin-amd64.tar.gz"
      sha256 "114adaeaba33766cc1c1c0e1a6ad3b163bccd40bff3421597864454acdb1cda2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.32/quark-linux-arm64.tar.gz"
      sha256 "fe53d4683f4d24e4cc85b55698b6ee3f707b3a2fbe2d9c1583a46e5a612c9060"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.32/quark-linux-amd64.tar.gz"
      sha256 "a3ce959e33b1779891319cdba3debe8981e85e0a6d6108e97964d0d0416e5b03"
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
