class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.12/quark-darwin-arm64.tar.gz"
      sha256 "2c6b82227532fca077c61e07c81662864cb7780726d9932c2d40120be78d25d3"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.12/quark-darwin-amd64.tar.gz"
      sha256 "afd222482b6d9823f0db40d076f17052f38e73f3d1728b7ae8bf074b6f9e9e63"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.12/quark-linux-arm64.tar.gz"
      sha256 "81feea62720eee5ba05cec30cac4e6dfdc36b03e79a7cd140868fc3e1fbc2896"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.12/quark-linux-amd64.tar.gz"
      sha256 "9cc47a913d05d79ff49ab73fd6368f9e1232289d28bf9fc5550a9fd456c47b29"
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
