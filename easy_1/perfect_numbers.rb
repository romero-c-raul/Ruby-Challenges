=begin
input: integer
output: string

Rules:
  - Explicit rules:
    - Write a program that can tell if a number is perfect, abundant or deficint
  
Problem Domain
  - Perfect:
    - Sum of divisors is equal to number
  - Abundant:
    - Sum of divisors is great than number
  - Deficient:
    - Sum of divisors is less than number

ALGORITHM
- Obtain divisors from 1 to given integer and put them in a collection
- Sum all the divisors and compare to given integer
  - If sum == integer return string perfect
  - If sum > integer return string abundant
  - If sum < integer return string decifient

=end

class PerfectNumber
  def self.classify(integer)
    raise StandardError if integer < 0
    
    factors = 1.upto(integer - 1).select do |current_number|
      integer % current_number == 0
    end
    
    if factors.sum == integer
      'perfect'
    elsif factors.sum > integer
      'abundant'
    else
      'deficient'
    end
  end
end