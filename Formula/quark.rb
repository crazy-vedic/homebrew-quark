class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.7/quark-darwin-arm64.tar.gz"
      sha256 "cc7c6c226b6e39ab4067a6f704c8c79502f7a1880c3c95a9e6e976cea7d38fd3"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.7/quark-darwin-amd64.tar.gz"
      sha256 "37d3c9cd4ee730f2e2a4813ccd08e5d9c462159b94bd8363b49c6fdc70728991"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.7/quark-linux-arm64.tar.gz"
      sha256 "2acba760cf06272a123c8faa943ac5060526e5cc62866f6c21867e143b3a6aee"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.7/quark-linux-amd64.tar.gz"
      sha256 "e633ff874bc4e0ce4dad096950ebeab97a3b281b9f4af104c113ed099ca07322"
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
