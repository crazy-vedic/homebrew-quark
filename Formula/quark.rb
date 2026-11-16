class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.3/quark-darwin-arm64.tar.gz"
      sha256 "a14557cd436e7b465af8c804a217a5676a9ac5df3683c76336376dfecca357a9"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.3/quark-darwin-amd64.tar.gz"
      sha256 "3f96ef3f096e4b9903cfcadb0fd9e6fd467687603a4ee81deb10c56c251bc6a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.3/quark-linux-arm64.tar.gz"
      sha256 "ee85239debf185223ec322b7a8c554ea6ad89669206ab446809fd8ab2be05b10"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.3/quark-linux-amd64.tar.gz"
      sha256 "20361a36eb6a6922b84eba59abf772177ff8698205f5ae1837f708d0389a9115"
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
