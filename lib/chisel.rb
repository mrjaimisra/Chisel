require '../lib/chiseler'

class Chisel
  attr_reader :input, :output

  def initialize
    input = File.read(ARGV[0])
    output = Chiseler.new(input)
    File.write(ARGV[1])
  end
end