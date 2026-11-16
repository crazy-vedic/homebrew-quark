class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.6/quark-darwin-arm64.tar.gz"
      sha256 "5d0727927aa3757574e98f81c8783f7e310d260cee4c0533c113afb00e5456db"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.6/quark-darwin-amd64.tar.gz"
      sha256 "bbb4076e4c599691d8cd75ffbf624e3545e8235dd043f73eb300d2a8e9a52974"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.6/quark-linux-arm64.tar.gz"
      sha256 "125d7089ba460592590e3cb93670a438ef7858908ebc4b294267df1a5d39c38e"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.6/quark-linux-amd64.tar.gz"
      sha256 "6455429407ac8fa8bd661d37749b40fecbb64326893e3a4f927cdadd8af57b5b"
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
