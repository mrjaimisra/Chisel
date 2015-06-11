require 'minitest/autorun'
require 'minitest/pride'
require '../lib/strong'

class StrongTester < Minitest::Test

  def test_it_converts_the_opening_tags
    i = Strong.new("**bold this**")
    half_bolded = i.convert_opening_tags
    assert_equal ["<strong>bold", "this**"], half_bolded
  end

  def test_it_converts_a_bolded_string_to_have_html_wrapping_tags
    s = Strong.new("This is a **bolded part of a sentence** within a **longer* sentence")
    stronger = s.bold
    assert_equal "This is a <strong>bolded part of a sentence</strong> within a <strong>longer* sentence", stronger
  end
end