# First attempt

class SumOfMultiples
  attr_accessor :set
  
  def initialize(*args)
    @set = args
  end
  
  def self.to(limit)
    # (2...limit).each_with_object([]) do |num, array|    # Brute force way, at first I pretty much just
    #   array << num if num % 3 == 0 || num % 5 == 0      # wrote two methods that do the same thing
    # end.sum
    self.new(3, 5).to(limit)      # Creating a new instance with a default argument, less redundancy
  end
  
  def to(limit)
    (2...limit).each_with_object([]) do |num, array|
      array << num if divisible?(num)
    end.sum
  end
  
  def divisible?(integer)
    set.any? do |current_number|
      integer % current_number == 0
    end
  end
end
