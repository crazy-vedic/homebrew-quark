class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.44/quark-darwin-arm64.tar.gz"
      sha256 "bbdbfae29c5dcc198e61f5fc93412c0a998e390b74aabc4d47899daedf0314e1"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.44/quark-darwin-amd64.tar.gz"
      sha256 "dcfb67f01915f9c03136a5535aa88895654d4bbae27fa2deac10049d510f5156"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.44/quark-linux-arm64.tar.gz"
      sha256 "db3b982b17950b4fe0e6e0e617ce00a4f5d57ae8b5cfa60b988791979ed8a068"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.44/quark-linux-amd64.tar.gz"
      sha256 "9ed5c8781f766c871df922d054916ca096e1f4971ef614f422e925b768638bb8"
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
