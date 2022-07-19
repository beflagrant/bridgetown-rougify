# frozen_string_literal: true

require_relative "./helper"

class TestBridgetownRougify < Bridgetown::TestCase
  def setup
    @config = Bridgetown.configuration(
      "root_dir"    => root_dir,
      "source"      => source_dir,
      "destination" => dest_dir,
      "quiet"       => true
    )
  end

  def build_site
    @site = Bridgetown::Site.new(@config)
    @filepath = @site.in_root_dir("frontend", "styles", "syntax-highlighting.css")
  end

  def teardown
    FileUtils.rm_rf(@filepath)
  end

  should "outputs content to the syntax highlighting css file " do
    build_site
    expected = Rouge::Theme.find("base16").render(scope: ".highlight")
    output = File.read(@site.in_root_dir("frontend", "styles", "syntax-highlighting.css"))
    assert_equal(expected, output)
  end

  should "accepts the theme configuration to determine the Rouge theme" do
    @config[:rougify] = { theme: "colorful" }
    build_site
    expected = Rouge::Theme.find("colorful").render(scope: ".highlight")
    output = File.read(@site.in_root_dir("frontend", "styles", "syntax-highlighting.css"))
    assert_equal(expected, output)
  end

  should "sends log warning if Rouge theme is not found" do
    @config[:rougify] = { theme: "gitbug" }
    build_site
    mock = Minitest::Mock.new
    mock.expect :warn, true, ["Rouge theme not found for gitbug"]

    Bridgetown.stub :logger, mock do
      build_site
    end
    assert_mock mock
  end
end
