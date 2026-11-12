class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-darwin-arm64.tar.gz"
      sha256 "58aed2abe923004e9781919cee9ddd1452be33a7f4bec0403ed95e2f690886ba"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-darwin-amd64.tar.gz"
      sha256 "21bf5c7e129de6dbb78215c2a760a142be73a8c7f18955ccad342a4d6138d504"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-linux-arm64.tar.gz"
      sha256 "2e15c3a7a7a170f99e5f50a14799dc18d702783d0f6a2f69880bd9d2f7005a42"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.42/quark-linux-amd64.tar.gz"
      sha256 "a55e1052c27d7a5034bcecd2edfc566ed2e7bc43cbcc235036b9cab652df6cd5"
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
