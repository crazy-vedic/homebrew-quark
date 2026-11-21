class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.29/quark-darwin-arm64.tar.gz"
      sha256 "c69d21d0baecd8fb522a959d776e9095c4714b3fa45d0c1c5f45e48140187e5f"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.29/quark-darwin-amd64.tar.gz"
      sha256 "f209f38bbc39928eeb462e5c56e7e748eca8ac0e8efa820f297a5372d0f55840"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.29/quark-linux-arm64.tar.gz"
      sha256 "137c9b3936cb27bc8defd8b4fbd48d7c6c273b04864c653fe478f4e0c8c2f485"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.4.29/quark-linux-amd64.tar.gz"
      sha256 "453fb3f8f812a18589270800f58e571859690faf705242215181735506e71b54"
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
