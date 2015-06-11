class UnorderedList
  def initialize(chunk)
    @chunk = chunk.split("\n")
  end

  def format_list
    @half_tags = @chunk.map {|chunk|
      "#{chunk.sub("* ", "<li>")}</li>"}
    # chunk.sub("* ", "<li>")}
    "<ul>\n#{@half_tags.join("\n")}\n</ul>"
  end
end