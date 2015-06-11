class OrderedList
  def initialize(chunk)
    @chunk = chunk.split("\n")
  end

  def format_list
    @half_tags =
    @chunk.map {|chunk| "<li>#{chunk[3..-1]}</li>"}
    "<ol>\n#{@half_tags.join("\n")}\n</ol>"
  end
end