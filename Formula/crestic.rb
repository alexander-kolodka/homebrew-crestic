class Crestic < Formula
  desc "Wrapper around restic with YAML-configured jobs"
  homepage "https://crestic.kolodka.fyi/"
  url "https://github.com/alexander-kolodka/crestic/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "1becb7c4b7da1e9f6deeeed9771b43e153f688ff52cc33cd9069b3b8fb3efad7"
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
