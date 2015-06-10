class Strong
  def initialize(chunk)
    @chunk = chunk.split("\n\n")
  end

  def to_html
    @front_tags = @chunk.map do |word|
      if word[0..1] == "**" || word[0] == "<"
         word.sub("**", "<strong>")
      else
         word
      end
    end

    @both_tags = @front_tags.map do |word|
      if word[-2..-1] == "**" || word[-1] == ">"
         word.sub("**", "</strong>")
      else
         word
      end
    end
    @both_tags.join(" ")
  end
end