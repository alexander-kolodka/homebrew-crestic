class Crestic < Formula
  desc "Wrapper around restic with YAML-configured jobs"
  homepage "https://crestic.kolodka.fyi/"
  url "https://github.com/alexander-kolodka/crestic/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "0f5e0803251c918196ead686ffc7b04da83cebbb187abe542b38335322936823"
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
