class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.13/quark-darwin-arm64.tar.gz"
      sha256 "64c4f04bc88e6a3f34aace49361377f4948e0ebc524685dd90ced81e21de5206"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.13/quark-darwin-amd64.tar.gz"
      sha256 "bbf2c1e75a8deb51cd66f7ce91f3114f21c276e206f08e5ce5ab833bf2f72544"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.13/quark-linux-arm64.tar.gz"
      sha256 "c8a96d2d27128c65ef06d2cdadaecf635520e9738aa1856a1096a4a47dfabd07"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.13/quark-linux-amd64.tar.gz"
      sha256 "68a8b13a7505ffba67f3a295ef00b1b4283419e11ef843669bb99785a4599d58"
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
