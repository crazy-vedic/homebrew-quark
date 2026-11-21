class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.27/quark-darwin-arm64.tar.gz"
      sha256 "343fc4927f7d7a2127041e089c4ae6b04a0a5d4d645df1ff9aad0bb143b6549a"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.27/quark-darwin-amd64.tar.gz"
      sha256 "985c95bf8349083789190c32391e72590e3af5e67f798015d0b36d69c77fc19e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.27/quark-linux-arm64.tar.gz"
      sha256 "c543c8fc6743db382ce1c63cea4c04c9d6a1227385cb407e3df983b278f11513"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.27/quark-linux-amd64.tar.gz"
      sha256 "6965264c77b0a0dd65b8ed8656357bd68e1d20193d4af2bb2f1aac3a9bf0abec"
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
