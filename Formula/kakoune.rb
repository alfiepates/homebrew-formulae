class Kakoune < Formula
  desc "mawww's experiment for a better code editor"
  homepage "https://github.com/mawww/kakoune"
  url "https://github.com/mawww/kakoune.git",
      :revision => "af61401e3ac3b0ebe0159145360b1d047423fdfa"
  # Completely arbitrary until kakoune is actually versioned
  # increment by one every time this formula is updated with
  # a new commit
  version "1"
  head "https://github.com/mawww/kakoune.git"

  depends_on "boost"
  depends_on "docbook-xsl" => :build
  depends_on "ncurses" => [:build, :recommended]
  depends_on "asciidoc" => [:build, "with-docbook-xsl"]

  def install
    ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"

    cd "src" do
      system "make", "install", "PREFIX=#{prefix}", "debug=no"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/kak --help")
  end
end
