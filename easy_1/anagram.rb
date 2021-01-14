=begin

input: string and array
output: array

rules
    - Explicit rules
      - Write a program that given a word and a list of possible anagrams,
        selects the correct sublist that contains tha anagrams of the word
          - Meaning an array with string objects will be returned
      - Given "listen" and %w(enlists google inlets banana) should return
        ["inlets"]

ALGORITHM
- Method will accept an array object (arr)
- Iterate through arr
  - Compare current element from arr to the input string (part of objects state)
    - if current element and input string are anagrams
      - push to collection
    - else
      do nothing
  
  Return collection with array elements deemed as anagrams

=end

class Anagram
  def initialize(string)
    @string = string
  end
  
  def match(array)
    array.select do |current_element|
      anagram?(current_element)
    end
  end
  
  private
  attr_reader :string
  
  def anagram?(array_element)
    return false if string.downcase == array_element.downcase
    
    arr_chars = array_element.downcase.chars.sort
    string_chars = string.downcase.chars.sort
    
    arr_chars == string_chars
  end
end
