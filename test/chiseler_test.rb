require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chiseler'

class ChiselerTest < Minitest::Test
  def test_it_takes_an_input
    input = "hello"
    chi = Chiseler.new(input)
    assert_equal "hello", input, "The input should be 'hello'"
  end

  def test_it_splits_the_input_into_chunks
    chi = Chiseler.new("hello\n\nhello")
    chunked_input = chi.chunk("hello\n\nhello")
    assert_equal ["hello", "hello"], chunked_input, "It should split the input into chunks when there are two newlines in a row"
  end

  def test_it_interprets_a_header_chunk_correctly
    chi = Chiseler.new("#hello")
    header = chi.interpret("#hello")
    assert_kind_of Header, header
  end

  def test_it_interprets_a_paragraph_chunk_correctly
    chi = Chiseler.new("hello")
    paragraph = chi.interpret("hello")
    assert_kind_of Paragraph, paragraph
  end

  def test_it_turns_a_header_to_html
    chi = Chiseler.new("#hello")
    html_header = chi.header
    assert_equal "<h1> hello </h1>", html_header
  end

  def test_it_turns_a_paragraph_to_html
    chi = Chiseler.new("hello")
    html_paragraph = chi.header
    assert_equal "<p> hello </p>", html_paragraph
  end

  def test_it_bolds_text
    chi = Chiseler.new(" **hello** ")
    bold_text = chi.halfacize
    assert_equal "<p> <strong>hello</strong> </p>", bold_text
  end

  def test_it_italicizes_text
    chi = Chiseler.new("## *hello*")
    bold_text = chi.emphasize
    assert_equal "<h2> <em>hello</em> </h2>", bold_text
  end

  def it_bolds_and_italicizes_text
    chi = Chiseler.new("## ***hello***")
    bold_and_italicized_text = chi.to_html
    assert_equal "<h2> <em>hello</em> </h2>", bold_and_italicized_text
  end

end