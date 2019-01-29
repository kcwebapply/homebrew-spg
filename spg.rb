# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spg < Formula
  desc "Save memo easily on terminal"
  homepage "https://github.com/kcwebapply/spg"
  url "https://github.com/kcwebapply/spg/archive/1.0.0.tar.gz"
  sha256 "0bdf108f50279944ad0e7412d50bfa8b8f5e123cd61be40b1f9ce52b0343a7c3"
  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    print buildpath
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
