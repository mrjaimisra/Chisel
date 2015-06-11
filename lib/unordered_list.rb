class UnorderedList
  def initialize(chunk)
    @chunk = chunk.split("\n")
  end

  def format_list
    @chunk.map {|chunk|
      if chunk[0] == "*" && chunk[1] == " "
        "\n#{chunk.sub("* ", "<li>")}</li>"
      else
        chunk
      end}.join("\n")
  end
end