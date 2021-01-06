=begin
input: string
output: nested array

rules
    - Explicit rules:
        - Write a program that will take a string of digits and give you all 
          the possible consecutive number series of length n in that string
        - Raise an error if we ask for a longer digit series that is longer than
          the given number

ALGORITHM
- Split the string into individual characters and convert chars into integers
- Obtain the consecutive number series that is asked (n) and add it to an array
- If 'n' is greater than the length of our string, raise argument error

=end

class Series
  
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end
  
  def slices(integer)
    arr = []
    
    if integer > @digits.size
      raise ArgumentError
    else
      @digits.each_cons(integer) do |set|
        arr << set
      end
    end
    arr
  end
end
