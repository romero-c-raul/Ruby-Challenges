=begin
input: integer
output: array

rules
    - Explicit rules
      - Write a program that uses the Sieve of Eratosthenes to find all the
        primes from 2 up to a given number
      - Create a range starting from 2 and continuing up to the 
        given limit

problem domain
  - algorithm consists of
    - take the next available unmarked number in your list (it is prime)
    - mark all the multiples of that number (they are not prime)

ALGORITHM
- Create an array from the given range
- Create an new array with size of range that contains only nil
- Create a hash where the range numbers are keys, and nils are values

- Iterate through array created from the given range |integer|
  - Iterate through the hash |key, value|
    - next if value is "marked!" or key is equal to the current integer
    - hsh[key] = 'marked' if key % integer == 0
  - Return an array of keys that are not marked

=end

class Sieve
  attr_accessor :range
  
  def initialize(integer)
    @range = (2..integer).to_a
  end
  
  def primes
    marked = Array.new(range.size)
    hash = range.zip(marked).to_h
    
    range.each do |current_integer|
      hash.each do |key, value|
        next if value == 'marked!' || key == current_integer
        hash[key] = 'marked' if key % current_integer == 0
      end
    end
    
    hash.select { |_, value| value == nil }.keys
  end
end