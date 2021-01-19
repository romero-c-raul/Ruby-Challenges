=begin

input: integers (three of them)
output: string

rules
  - Explicit rules
    - Write a program to determine whether a triangle is equilateral, isosceles
      or scalene
    - All sides must be of length >0
    - The sum of any two sides must be greater than or equal to the third side

problem domain
  - Equilateral triangle has all three sides same length
  - Isosceles has two sides of same length
  - Scalene has all sides of different lengths
  
ALGORITHM
- Check that none of the sides are equal to 0


- Remove duplicates
  - If one left, 
    - this is equilateral

    
  - If two left,
    - Check that the sum of lengths of any two sides must be greater than or equal
      to the length of the third side
    - Sorting collection in ascending order
    - Take the first two elements and make sure their sum is >= longest side
    - this is isosceles
    
  - if three left, 
    - Check that the sum of lengths of any two sides must be greater than or equal
      to the length of the third side
    - Sorting collection in ascending order
    - Take the first two elements and make sure their sum is >= longest side
    - Check that the sum of lengths of any two sides must be greater than or equal
      to the length of the third side
    - This is scalene

=end

class Triangle
  def initialize(int1, int2, int3)
    check_if_valid_lengths(int1, int2, int3)
    @sides = [int1, int2, int3]
  end
  
  def check_if_valid_lengths(int1, int2, int3)
    arr = [int1, int2, int3].sort
    
    raise ArgumentError if arr.any? { |num| num <= 0 }
    raise ArgumentError if arr[0..1].sum < arr.last
  end
  
  def kind
    number_of_unique_sides = @sides.uniq.size
    case number_of_unique_sides
    when 3 then "scalene"
    when 2 then "isosceles"
    when 1 then "equilateral"
    end
  end
end