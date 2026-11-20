class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.24/quark-darwin-arm64.tar.gz"
      sha256 "261031ac127b762ebd1fb57abb78c56d5c99a0c9f4ff9990bbabdc7f47b5f92c"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.24/quark-darwin-amd64.tar.gz"
      sha256 "d85cc85d11a6abafc29186b5835d0396fb9f4201878553cf1f436932589552de"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.24/quark-linux-arm64.tar.gz"
      sha256 "f11be6bc22bb71d5096c7ff7fb0894bf28290c4cec13a93bd27ab54b42271166"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.24/quark-linux-amd64.tar.gz"
      sha256 "e2c2f37e0b4fd34af71695d15f85da0baf3ea9c10b2bd0ab42f21e5dcae2fc93"
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
