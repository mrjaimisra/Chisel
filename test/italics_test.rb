require 'minitest/autorun'
require 'minitest/pride'
require '../lib/italic'

class StrongTester < Minitest::Test

  def test_it_exists
    skip

  end

  def test_it_converts_a_bolded_string_to_have_html_wrapping_tags
    i = Italic.new("This is an *emphasized part of a sentence* within a *longer** sentence")
    italicized = i.to_html
    assert_equal "This is an <em>emphasized part of a sentence</em> within a <em>longer</em>* sentence", italicized
  end
end