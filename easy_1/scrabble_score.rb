# frozen_string_literal: true

#
# input: string
# output: integer
#
# rules
#   - Explicit rules
#     - Write a program that, given a word, computes the Scrabble score
#   - Implicit rules
#     - Empty string, whitespace, and nil are equal to a score of 0
#
# ALGORITHM
# - Create hash with character set as key and corresponding score as value
# - Validate input string
#   - Return 0 if input string is an empty string, whitespace, or nil
# - Split words by individual characters
#   - Transform character to their individual score
#   - Sum up all characters
#
# ALGORITHM - obtain_value
# - Identify which character set contains the letter we are iterating through
# - Use that character set to obtain value

class Scrabble
  SCORES = {
    %w[A E I O U L N R S T] => 1, %w[D G] => 2, %w[B C M P] => 3, %w[F H V W Y] => 4,
    %w[K] => 5, %w[J X] => 8, %w[Q Z] => 10
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if invalid_string?(@word)

    letters = @word.split('')

    letters.map do |current_char|
      obtain_value(current_char)
    end.sum
  end

  def obtain_value(letter)
    SCORES.keys.each do |current_set|
      return SCORES[current_set] if current_set.include?(letter.upcase)
    end
  end

  def invalid_string?(word)
    case word
    when nil then true
    when '' then true
    when /\s/ then true
    end
  end

  def self.score(word)
    new(word).score
  end
end
