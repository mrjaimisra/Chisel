require '../lib/chiseler'

class Chisel
  attr_reader :input, :output

  def initialize
    input = File.read(ARGV[0])
    html = Chiseler.new(input).to_html
    File.write(ARGV[1] + '\n', html)
    puts "Converted"
  end

end

Chisel.new