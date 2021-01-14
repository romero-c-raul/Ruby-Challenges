=begin
input: string
output: hash

ALGORITHM
- Split input string into individual words
- Iterate through collection, and transform each element into a nested
  array that contains current word and how many times in appears in collection
- Remove duplicates
- Turn nested arrays into a hash
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    word_collection = phrase.scan(/\b[[a-z][A-Z][0-9]']+\b/).map(&:downcase)
    
    word_count = word_collection.map do |current_word|
      [current_word, word_collection.count(current_word)]
    end
    
    word_count.uniq.to_h
  end
  
  private
  attr_reader :phrase
end