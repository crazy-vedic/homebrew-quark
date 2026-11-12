class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.31/quark-darwin-arm64.tar.gz"
      sha256 "ac815378f3080d9b16c7cb5850addb2cfe8afda880f55f45df5dc13d3823a03a"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.31/quark-darwin-amd64.tar.gz"
      sha256 "61d4b7d28a262c1996b2a7682c531c64e8172ae0a46a498634e87bd13a6976f6"
    end
  end

  def install
    bin.install "quark"
  end

  test do
    system bin/"quark", "--version"
  end
end
