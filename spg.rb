# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spg < Formula
  desc "Save memo easily on terminal"
  homepage "https://github.com/kcwebapply/spg"
  url "https://github.com/kcwebapply/spg/archive/1.1.0.tar.gz"
  sha256 "c0f8750b0e82ad16da127d2e3127d806a57f979c6f326d1c336c275bcf1e388e"
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
