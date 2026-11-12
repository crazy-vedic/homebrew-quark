class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.30/quark-darwin-arm64.tar.gz"
      sha256 "c77ec053b6c0447d31dfab005c92ddec36784f33f61546924067c0905d775d78"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.30/quark-darwin-amd64.tar.gz"
      sha256 "cdc6bfbea14b21914b47432376fcd23c8a650fa327ca45ce4b0c37ec14329df3"
    end
  end

  def install
    bin.install "quark"
  end

  test do
    system bin/"quark", "--version"
  end
end
