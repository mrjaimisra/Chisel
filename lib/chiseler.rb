require '../lib/header'
require '../lib/paragraph'
require '../lib/strong'
require '../lib/italic'
require '../lib/unordered_list'

class Chiseler
attr_reader :chunks, :listed_chunks

  def initialize(input)
    @input = input
    @chunks = input.split("\n\n")
  end

  def make_list
    @chunks.map {|chunk| UnorderedList.new(chunk).format_list}
  end

  def wrap
    make_list.map {|chunk|
      if chunk[0] == '#'
        Header.new(chunk).to_html
      else
        Paragraph.new(chunk).to_html
      end}
  end

  def emphasize
    wrap.map {|chunk| Strong.new(chunk).bold}
        .map {|chunk| Italic.new(chunk).italicize}
        .join("\n\n")
  end

end