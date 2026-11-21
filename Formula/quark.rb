class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.26/quark-darwin-arm64.tar.gz"
      sha256 "8b46beeaac114cdadbfeb09f86e2b4a6aaa65695098a9e860dbb2e2fa9584362"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.26/quark-darwin-amd64.tar.gz"
      sha256 "0f40c795d7057d48367afcff150627288409d525f17dcd754a932b663cf283dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.26/quark-linux-arm64.tar.gz"
      sha256 "1295395b3b1a53069c2dae883070c8c4cdf11d235f7697ed08ad0df395693fb4"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.26/quark-linux-amd64.tar.gz"
      sha256 "101ead51104ef347b1dd9c4b7ec51fcdda094fe60e7516939abd1f546858b2e3"
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
