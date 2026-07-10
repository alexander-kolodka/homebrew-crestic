class Crestic < Formula
  desc "Wrapper around restic with YAML-configured jobs"
  homepage "https://crestic.kolodka.fyi/"
  url "https://github.com/alexander-kolodka/crestic/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "0c3a74afcd2c994322809b0c1db848a258341e3d21f11916e53a281cb17cedf9"
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
