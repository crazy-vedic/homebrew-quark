class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.1/quark-darwin-arm64.tar.gz"
      sha256 "9e51566609a2714bc7d2be80027c36b8392e027336789f6e8e1fa06ec60c2c29"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.1/quark-darwin-amd64.tar.gz"
      sha256 "89b54047a37de920482fd5df5c4563cd7fda4d1354ab4121c9d1c42068ec67ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.1/quark-linux-arm64.tar.gz"
      sha256 "ee235535e29cc81fd65b80796931bb384513fbe0a25540e60d8e341d802deabb"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.1/quark-linux-amd64.tar.gz"
      sha256 "52ab0d33c7db4f93bacef15b5f277467364f5d67e922f951ccd6f7de203ca9af"
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
