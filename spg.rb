# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spg < Formula
  desc "Save memo easily on terminal"
  homepage "https://github.com/kcwebapply/spg"
  url "https://github.com/kcwebapply/spg/archive/1.0.2.tar.gz"
  sha256 "28af272571e3d8a9aa4a555655e6e3a6ca275773a538ea314d22bec590891ad6"
  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    system "go", "get", "github.com/kcwebapply/spg"
    ENV["GOPATH"] = buildpath
    spg_path = buildpath/"src/github.com/kcwebapply/spg/"
    spg_path.install buildpath.children

    cd spg_path do
      system "dep", "ensure", "-vendor-only"
      system "go", "build"
      bin.install "spg"
    end
  end
end
