class Header
  def initialize(chunk)
    @chunk = chunk
  end

  def to_html
    num = @chunk.count("#")
    @chunk.delete!("#")
    "<h#{num}>#{@chunk}</h#{num}>\n\n"
  end

end