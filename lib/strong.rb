class Strong
  def initialize(chunk)
    @chunk = chunk.split(" ")
  end

  def convert_opening_tags
    @chunk.map do |word|
      if word[0..1] == "**" || word[0] == "<"
        word.sub("**", "<strong>")
      else
        word
      end
    end
  end

  def bold
     convert_opening_tags.map do |word|
      if word[-2..-1] == "**" || word[-1] == ">"
        word.sub("**", "</strong>")
      else
        word
      end
    end.join(" ")
  end

end