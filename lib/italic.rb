class Italic
  def initialize(chunk)
    @chunk = chunk.split("\n\n")
  end

  def to_html
    @front_tags = @chunk.map do |word|
      if word[0] == "*" || word[0] == "<"
        word.sub("*", "<em>")
      else
        word
      end
    end

     @both_tags = @front_tags.map do |word|
      if word[-1] == "*" || word[-1] == ">"
        word.sub("*", "</em>")
      else
        word
      end
    end
    @both_tags.join(" ")
  end
end