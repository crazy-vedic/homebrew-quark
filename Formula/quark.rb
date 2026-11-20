class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.20/quark-darwin-arm64.tar.gz"
      sha256 "2d3636af94136e22728b078810faf6149e7ff5c688019cffaa45b3753d631f64"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.20/quark-darwin-amd64.tar.gz"
      sha256 "8ef3d8b2d0f73d2e712099fafd1357783ed89938749f8477cd412c813ba731bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.20/quark-linux-arm64.tar.gz"
      sha256 "bee24416064adc02a64f6404c2f19d29417b5d5f94edc2f4b95edff93f081de5"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.20/quark-linux-amd64.tar.gz"
      sha256 "8a747dbdc041ea1bb379af06d15a85d503d2f7ed594fbf55a44063b453083c98"
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
