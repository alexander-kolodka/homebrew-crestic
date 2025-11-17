class Crestic < Formula
  desc "Wrapper around restic with YAML-configured jobs"
  homepage "https://crestic.kolodka.fyi/"
  url "https://github.com/alexander-kolodka/crestic/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "6ae2963b3c0aede9a6c5f2e428385516b1689e08de0334e0adfb4b2c2982dcb8"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X 'github.com/alexander-kolodka/crestic/internal/version.Version=#{version}'
    ].join(" ")
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    output = shell_output("#{bin}/crestic --version")
    assert_match "crestic version #{version}", output
  end
end
