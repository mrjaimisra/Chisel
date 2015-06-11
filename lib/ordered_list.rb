class OrderedList
  def initialize(chunk)
    @chunk = chunk.split("\n")
  end

  def format_list
    @chunk.map {|chunk|
      if chunk[0].to_i.class == Fixnum && chunk[1] == "."
        "<li>#{chunk[3..-1]}</li>"
      else
        chunk
      end}
  end
end