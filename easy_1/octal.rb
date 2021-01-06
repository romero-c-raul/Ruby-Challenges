=begin
input:string
output: integer

rules
    - Explicit rules:
      - Implement octal to decimal conversion. Give an octal input string, your
        program should produce a decimal output
    - Implicit numbers:
      - Octal numbers only contain 0-7
ALGORITHM
- Split input string into individual characters and convert to integer
- Reverse previously created array
- Transform each integer by multiplying *10 ^ current index
- Sum contents in array

=end

class Octal
  def initialize(string)
    @string = string
  end
  
  def to_decimal
    return 0 unless valid_string?
    
    digits_array = @string.chars.reverse.map(&:to_i)
    
    digits_array.map.with_index do |current_integer, index|
      current_integer * (8 ** index)
    end.sum
  end
  
  def valid_string?
    characters = @string.chars
    valid_octal_numbers = ("0".."7").to_a
    
    characters.all? do |current_char|
      valid_octal_numbers.include?(current_char)
    end
  end
end
