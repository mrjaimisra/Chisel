require 'minitest/autorun'
require 'minitest/pride'
require '../lib/unordered_list'

class UnorderedListTester < Minitest::Test

  def test_it_converts_an_unordered_list_of_one_element
    list = UnorderedList.new("* This is the first element")
    unordered_list = list.format_list
    assert_equal "<ul>\n<li>This is the first element</li>\n</ul>", unordered_list
  end

  def test_it_converts_an_unordered_list_of_two_elements
    list = UnorderedList.new("* This is the first element\n* This is the second element")
    unordered_list = list.format_list
    assert_equal "<ul>\n<li>This is the first element</li>\n<li>This is the second element</li>\n</ul>", unordered_list
  end
end


