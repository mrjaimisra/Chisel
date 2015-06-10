require '../lib/header'
require '../lib/paragraph'
require '../lib/strong'
require '../lib/italic'

class Chiseler

  def initialize(input)
    @input = input
    @chunks = chunk(input)
  end

  def chunk(input)
    input.split("\n\n")
  end

  def interpret(chunk)
    if chunk[0] == '#'
      Header.new(chunk)
    else
      Paragraph.new(chunk)
    end
  end

  def to_html
    @chunks.map {|chunk| interpret(chunk)}
           .map {|chunk| chunk.to_html}
           .map {|chunk| strong(chunk)}
           .map {|chunk| chunk.to_html}
           .map {|chunk| italicize(chunk)}
           .map {|chunk| chunk.to_html}
  end

  def strong(chunk)
    Strong.new(chunk)
  end

  def italicize(chunk)
    Italic.new(chunk)
  end

end

chi = Chiseler.new("# My Life in Desserts

## Chapter 1: The Beginning

\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in
**Food & Wine** this place has been packed every night.")

chi_emphasized = Chiseler.new("**stronged**")

puts chi.to_html