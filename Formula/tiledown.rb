class Tiledown < Formula
  desc "Swift static site generator with a Markdown-canonical format and typed tiles"
  homepage "https://tiledown.com"
  url "https://github.com/TileDown/tile-down/releases/download/v0.5.0/tiledown-0.5.0-macos-arm64.tar.gz"
  version "0.5.0"
  sha256 "097d645469b0a72bd04c28b637ca21a493a249929d1e7698a4b3551a8b52d7d9"
  license "AGPL-3.0-or-later"

  # Ships an Apple Silicon (arm64) bottle only for now; built against macOS 14+.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    # Keep the binary next to its SwiftPM resource bundle (the math font lives in
    # Tiledown_TileMath.bundle and is resolved relative to the executable), then
    # expose it on PATH via a thin exec script.
    libexec.install "tiledown", "Tiledown_TileMath.bundle"
    bin.write_exec_script libexec/"tiledown"
  end

  test do
    (testpath/"site").mkpath
    (testpath/"site/index.md").write("# Test\n\n$$e^{i\\pi}+1=0$$\n")
    system bin/"tiledown", "build-site", testpath/"site", testpath/"out"
    # Display math must typeset to a static SVG, which proves the font bundle
    # resolved at runtime after relocation.
    assert_match "<svg", (testpath/"out/index.html").read
  end
end
