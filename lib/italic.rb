class Italic
  def initialize(chunk)
    @chunk = chunk.split(" ")
  end

  def convert_opening_tags
    @chunk.map do |word|
      if word[0] == "*"
        word.sub("*", "<em>")
      else
        word
      end
    end
  end

  def italicize
    convert_opening_tags.map do |word|
      if word[-1] == "*" || word[-1] == ">"
        word.sub("*", "</em>")
      else
        word
      end
    end.join(" ")
  end
end