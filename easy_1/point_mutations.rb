=begin

input: string
output: integer

rules
    - Explicit rules
      - Write a program that can calculate the hamming distance between two
        DNA strands
        
        - The two DNA strings will be represented by strings.
          - We will compare the current letter at the same string position to
            determine if there is any sort of "distance" between the two strands
            - Example:
              - GAGCCTACTAACGGGAT
                CATCGTAATGACGGCCT
                ^ ^ ^  ^ ^    ^^  -> The distance between these two strands is 7
          
          - If two sequences are of unequal length, compute hamming distance over
            shorter length

ALGORITHM - #hamming_distance(seq_two)
- Receiving string object as argument (seq_two)
- Split seq_two into individual characters
- Split seq_one (part of objects state)
- Iterate through each index position, on both sequences and count how many
  letters on the same index position are different
    - If sequence length is mismatched, iterate through the index position of 
      the shorter sequence
- Return count
=end

class DNA
  def initialize(initial_sequence)
    @initial_sequence = initial_sequence
  end
  
  def hamming_distance(other_sequence)
    max_index = max_distance_considered(other_sequence) - 1
    distance_count = 0
    
    0.upto(max_index) do |index|
      distance_count += 1 unless initial_sequence.chars[index] == other_sequence.chars[index]
    end
    
    distance_count
  end
  
  private
  attr_reader :initial_sequence
  
  def max_distance_considered(other_sequence)
    initial_sequence.size < other_sequence.size ? initial_sequence.size : other_sequence.size
  end
end