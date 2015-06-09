class Chiseler

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def find_length
    @input.length
  end

  def chunk
    @chunked_input = @input.lines("\n\n")
  end

  def header?
    @chunked_input.each do |chunk|
      if chunk[0][0] == "#"
        true
      else
        false
      end
    end
  end

end
# for all headers, count the number of #'s at the beginning of each chunk
# so, if header?(start with chunked_input[0]) == true
# +1 to headers_counter
# then check position 1 in chunked_input[0]
    # if chunked_input[0][1] == #
    # +1 to headers_counter
    # then check position 2 in chunked_input[0]
    # if chunked_input[0][2] == #
    # +1 to headers_counter
    # and so on...

chi = Chiseler.new("#hello, there, my name is Jai.

I wanted to see if this would work.

##okay, it works now, goodbye")
puts chi.chunk
puts chi.find_length