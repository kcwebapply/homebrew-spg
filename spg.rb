# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spg < Formula
  desc "Save memo easily on terminal"
  homepage "https://github.com/kcwebapply/spg"
  url "https://github.com/kcwebapply/spg/archive/1.0.3.tar.gz"
  sha256 "dced1c9465ed6d86aa122e860cc610fab308ae3e3eb3554a7067097e8a2b0b91"
  depends_on "dep" => :build
  depends_on "go" => :build

  def install
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
