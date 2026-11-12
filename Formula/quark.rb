class Quark < Formula
  desc "Quark - A fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"
  version "1.3.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.25/quark_1.3.25_darwin_arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.25/quark_1.3.25_darwin_amd64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "quark"
  end

  test do
    system "#{bin}/quark", "--version"
  end
end
