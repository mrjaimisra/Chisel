require 'minitest/autorun'
require 'minitest/pride'
require '../lib/ordered_list'

class OrderedListTester < Minitest::Test

  def test_it_converts_an_unordered_list_of_one_element
    list = OrderedList.new("1. This is the first element")
    unordered_list = list.format_list
    assert_equal "<ol>\n<li>This is the first element</li>\n</ol>", unordered_list
  end

  def test_it_converts_an_unordered_list_of_two_elements
    list = OrderedList.new("1. This is the first element\n7. This is the second element")
    unordered_list = list.format_list
    assert_equal "<ol>\n<li>This is the first element</li>\n<li>This is the second element</li>\n</ol>", unordered_list
  end
end