class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.5/quark-darwin-arm64.tar.gz"
      sha256 "73bc4ff139fa4392eab8240984a09845bce9f038072f8f7ca132a8773c69b456"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.5/quark-darwin-amd64.tar.gz"
      sha256 "6cf236d12cd79bb637d91e2bbd86aada16d42be4425c64f35021cf815d25755b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.5/quark-linux-arm64.tar.gz"
      sha256 "daee9faa17e79469aa325b51e6999121ba6c0132ef2980d68bc2ae21b4ba74ae"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.5/quark-linux-amd64.tar.gz"
      sha256 "3790fbab5a794903c0e954a4ab56cf0473dc344fac795cb922e6279805fed185"
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
