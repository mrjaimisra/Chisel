require '../lib/header'
require '../lib/paragraph'
require '../lib/strong'
require '../lib/italic'
require '../lib/unordered_list'

class Chiseler
  attr_accessor :interpreted_chunks
attr_reader :chunks

  def initialize(input)
    @input = input
    @chunks = input.split("\n\n")
  end

  def wrap
    @chunks.map {|chunk|
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

chi = Chiseler.new("# My Life in Desserts

## Chapter 1: The Beginning

\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\n\nthis is an unordered list:\n* This is the first element\n* This is the second element")

puts chi.emphasize

# [**, **, **, **, **, **, **] = [0,1,2,3,4,5,6]
# ["<strong>","</strong>","<strong>","</strong>","<strong>","</strong>","<strong>","</strong>"]
# [[0]Food & Wine[1] this place has been packed every night]
# ["<strong>Food & Wine</strong> this place has been packed every night"]
#
#
# chunk = "**Food & Wine** this place has been packed every night"
