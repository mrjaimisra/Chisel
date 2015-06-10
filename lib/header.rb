class Header
  def initialize(chunk)
    @chunk = chunk
  end

  def to_html
    num = @chunk.scan("#").count
    @chunk.delete!("#")
    "<h#{num}>#{@chunk}</h#{num}>\n\n"
  end

  def test
    chunk[0] == '#'
  end

end