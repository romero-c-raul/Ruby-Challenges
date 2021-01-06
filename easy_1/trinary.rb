class Trinary
  def initialize(string)
    @string = string
  end
  
  def to_decimal
    return 0 unless valid_string?
    
    digits_array = @string.chars.reverse.map(&:to_i)
    
    digits_array.map.with_index do |current_integer, index|
      current_integer * (3 ** index)
    end.sum
  end
  
  def valid_string?
    characters = @string.chars
    valid_trinary_numbers = ("0".."2").to_a
    
    characters.all? do |current_char|
      valid_trinary_numbers.include?(current_char)
    end
  end
end