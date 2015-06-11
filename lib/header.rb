class Header
  def initialize(chunk)
    @chunk = chunk
  end

  def to_html
    num = @chunk.count("#")
    @chunk.delete!("#")
    @chunk[0] = ''
    "<h#{num}>#{@chunk}</h#{num}>\n\n"
  end

end