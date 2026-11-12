class Quark < Formula
  desc "Quark - A fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"
  version "1.3.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.33/quark-darwin-arm64.tar.gz"
      sha256 "afd699476af7974a0227a76742f76ba50d465e590832181fc397209ce01bcf83"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.33/quark-darwin-amd64.tar.gz"
      sha256 "ccb0dba222c66ea2a1a9046d5e14be163d59ea5b771dc4b8d4ee5160b1734957"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.33/quark-linux-arm64.tar.gz"
      sha256 "80b8cd87f87b3c0fdc3dd860a096e713b303e7ff3c74f4884e90d324db7eafe3"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.33/quark-linux-amd64.tar.gz"
      sha256 "9d273ccd02e5181d28c18861252809887b81fa8f739720f1e8e69f1180e6f53c"
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
