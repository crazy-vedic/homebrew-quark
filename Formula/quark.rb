class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.8/quark-darwin-arm64.tar.gz"
      sha256 "eb7a398b7939c6d3736bc8ce9432e8b9922e69f3da881c42b45395f82628e63d"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.8/quark-darwin-amd64.tar.gz"
      sha256 "a0c12094fb530fc1a6a7bdb6a33ac5234f96a2ca5a6992cfa1e69429593f9c7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.8/quark-linux-arm64.tar.gz"
      sha256 "bc1b646dc0ec0aeeec04e3687ef888173548f2a2b4d700196bb72c0681927f82"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.8/quark-linux-amd64.tar.gz"
      sha256 "d7f57f1a2de9209c8fd1c1e1a70017ce8335770ca3fe121f530ef76a39d874be"
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
