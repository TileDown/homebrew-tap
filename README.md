# TileDown Homebrew tap

Homebrew formulae for [TileDown](https://tiledown.com), a Swift static site
generator with a Markdown-canonical source format and a typed tile model.

## Install

```sh
brew install tiledown/tap/tiledown
```

Or tap first, then install:

```sh
brew tap tiledown/tap
brew install tiledown
```

## Notes

- Ships an Apple Silicon (arm64) bottle built against macOS 14 (Sonoma) and
  later. An Intel bottle may follow.
- The bottle bundles the math font resource alongside the binary, so build-time
  TeX-to-SVG math works out of the box.

Engine source and issues: <https://github.com/TileDown/tile-down>.
