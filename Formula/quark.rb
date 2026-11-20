class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.25/quark-darwin-arm64.tar.gz"
      sha256 "3808a4eb186c894da2de9fb4b8616a23736763a12d4bd5f8acaff18144d3390e"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.25/quark-darwin-amd64.tar.gz"
      sha256 "b6b78860e73136c981f99172d5a03ce6b1e43f23340fee727aaed1fa78edc785"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.25/quark-linux-arm64.tar.gz"
      sha256 "94f3b8d55fc653c13d31b84a167b941936f7af819c99d686d30def9c1113143f"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.25/quark-linux-amd64.tar.gz"
      sha256 "f71ebbc2205bf58c2043ab1b87cfabf60a83b73842bdea4bca1a4fedf23fed1d"
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
