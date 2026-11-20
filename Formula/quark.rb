class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.18/quark-darwin-arm64.tar.gz"
      sha256 "4bf096afa09abb08957d8a0cb0e1eb746fd97002784aa0b0e22982d92eb0160d"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.18/quark-darwin-amd64.tar.gz"
      sha256 "82bfdbcedde8921331e13d2703495e4b4054fe1b210079e460e23b1dfab913c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.18/quark-linux-arm64.tar.gz"
      sha256 "6aa5a7c7e149c442c5107b651949259caf735e51f93eac211789f876fbd82098"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.18/quark-linux-amd64.tar.gz"
      sha256 "5eb70e1c0a6fb396f21b2ee8ce1a15001f2b8ead963a6ec72765130aef334a16"
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
