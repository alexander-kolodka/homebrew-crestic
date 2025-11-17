class Crestic < Formula
  desc "Wrapper around restic with YAML-configured jobs"
  homepage "https://crestic.kolodka.fyi/"
  url "https://github.com/alexander-kolodka/crestic/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "1d6b0a54707eaf308d378225983f319da5396f1f484862708b6d7b597afcd241"
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
