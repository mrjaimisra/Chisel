require 'minitest/autorun'
require 'minitest/pride'
require '../lib/italic'

class StrongTester < Minitest::Test

  def test_it_converts_the_opening_tags
    i = Italic.new("*italicize this*")
    half_italicized = i.convert_opening_tags
    assert_equal ["<em>italicize", "this*"], half_italicized
  end

  def test_it_converts_an_italicized_string_to_have_html_wrapping_tags
    i = Italic.new("This is an *emphasized part of a sentence* within a *longer** sentence")
    italicized = i.italicize
    assert_equal "This is an <em>emphasized part of a sentence</em> within a <em>longer</em>* sentence", italicized
  end
end