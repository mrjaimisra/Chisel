class Paragraph

  def initialize(chunk)
    @chunk = chunk
  end

  def to_html
    "<p>#{@chunk}</p>"
  end
end