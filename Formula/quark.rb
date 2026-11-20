class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.23/quark-darwin-arm64.tar.gz"
      sha256 "6b3368466ba1934949c7e59433273c0dd6ce1a3c9643db2598e0d3733ea99c09"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.23/quark-darwin-amd64.tar.gz"
      sha256 "a68c8c7e48da08e2b69a8228a453f9a3bade5501481e500ed6e61d8fc33d98e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.23/quark-linux-arm64.tar.gz"
      sha256 "50e9c74685a3c855547d664462709491cfaecf128e4c33a6ff8f2aedad6526bc"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.23/quark-linux-amd64.tar.gz"
      sha256 "fa8716a00491ba79b1913ab83bf966eb4f33799b92ae84d076b2476de0f578d0"
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
