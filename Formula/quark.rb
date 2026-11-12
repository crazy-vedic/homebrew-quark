class Quark < Formula
  desc "Fast and lightweight utility"
  homepage "https://github.com/crazy-vedic/Quark"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.38/quark-darwin-arm64.tar.gz"
      sha256 "dad37302941bef2110de49a5ddade7e4deab44f4f5c4572c0bd5edf4d64d488c"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.38/quark-darwin-amd64.tar.gz"
      sha256 "92f9f3fd311a57beaa1b677177eb5d0ab26f9360897bb5245226e169f10fc7d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.38/quark-linux-arm64.tar.gz"
      sha256 "11596f2d93bdf494ed22d88368b533ee92a5929e3d49042ec4ca358d40222df1"
    else
      url "https://github.com/crazy-vedic/Quark/releases/download/v1.3.38/quark-linux-amd64.tar.gz"
      sha256 "f96b5a28e0be085f872f8fa4c8069d6d7f013e05b4235916abcdf89e67510099"
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
