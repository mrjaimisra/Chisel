
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chiseler'

class ChiselerTest < Minitest::Test
  def test_it_takes_an_input
    chi = Chiseler.new("hello")
    input = chi.input
    assert_equal "hello", input, "The input should be 'hello'"
  end

  def test_it_splits_the_input_into_chunks
    chi = Chiseler.new("hello\n\nhello")
    chunked_input = chi.chunk
    assert_equal ["hello\n\n", "hello"], chunked_input, "It should split the input into chunks when there are two newlines in a row"
  end

  def test_it_finds_the_length
    chi = Chiseler.new("12345")
    input_length = chi.find_length
    assert_equal 5, input_length
  end

  def test_it_identifies_chunk_with_header
    chi = Chiseler.new("#hello\n\nhello")
    chi.chunk
    assert chi.header?
  end

  def test_it_determines_header_size_by_number_of_hashtags
    chi = Chiseler.new("##hello\n\nhello")
    chi.chunk
  end

end