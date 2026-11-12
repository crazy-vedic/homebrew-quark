class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.36/quark-darwin-arm64.tar.gz"
      sha256 "d6246ae8b9844fa801fee5ff51b3b6bfc295496b6ec71ccd73f04bb2bc31282f"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.36/quark-darwin-amd64.tar.gz"
      sha256 "bd5cf43933db50f97ad8d4ac3e7a0bf548d594c10b8453a44d9971b13b29e4b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.36/quark-linux-arm64.tar.gz"
      sha256 "6280adad5db0ed454484c061178284cdd8398724e925bd459dd8356260daf3ed"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.36/quark-linux-amd64.tar.gz"
      sha256 "e667b7c55b97f0e0dfac2e20465f2a0c6517e8eb93c9a0c44f2893d65bda4199"
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
