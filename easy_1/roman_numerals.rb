=begin

input: integer
output: string


problem domain:
- case for 4 digit numbers
  - 1000, 2000, 3000, 4000 ...
  - Letter M
  - Case 1 - M * (current_number / 1000)
- case for 3 digit numbers
  - 100, 200, 300 ... 900
  - Letter C, D
  - Case 1 - 100:300
    - Letter C
  - Case 2 - 400
  - Case 3 - 500:800
  - Case 2 - 900
    - CM
- case for 2 digit numbers
  - Letters L, X
  - 10, 20, 30 40 ...90
  - Case 1: 10:30
    - X * (current_number / 10)
  - Case 2: 40
    - XL
  - Case 3: 50:80
    - L + X * (current_number / 10)
  - Case 4: 90
    - XC
- case for 1 digit number
  - Letters I V
  - Case 1: 1:3
  - Case 2: 4
  - Case 3: 5:8
  - Case 4: 9
  
- For 3 digits
  - There is a midpoint at 500
  - C, D
  - Ranges: [100-300][400][500-800][900]
- For 2 digits 
  - There is a midpoint at 50
  - X, L
  - [10-30][40][50-80][90]
- For 1 digit
  - There is a midpoint at 5
  - I V
  - [1-3][4][5-8][9]

  
ALGORITHM
- Split number into thousands, hundredths, decimals etc into a collection
- Go through each number in collection
- If a number has 4 digits
  - call method convert_roman_four_digits
- If a number has 3 digits
  - call method convert_roman_three_digits
- If a number has 2 digits
  - call method convert_roman_two_digits
- If a number has 1 digits
  - call method convert_roman_one_digits


=end

class Integer
  def to_roman
    digits = self.digits.map.with_index do |num, index|
      num * (10 ** index)
    end.reverse
    
    convert_digits(digits)
  end
  
  def convert_digits(digits)
    digits.map do |current_number|
      number_length = current_number.to_s.size
      case number_length
      when 4 
        convert_roman_four_digits(current_number)
      when 3 
        convert_roman_three_digits(current_number)
      when 2 
        convert_roman_two_digits(current_number)
      when 1 
        convert_roman_one_digits(current_number)
      end
    end.join
  end
  
  def convert_roman_four_digits(integer)
    'M' * (integer / 1000)
  end
  
  def convert_roman_three_digits(integer)
    case integer
    when 100..300
      'C' * (integer / 100)
    when 400
      'CD'
    when 500..800
      'D' + 'C' * (integer / 100 - 5)
    when 900
      'CM'
    end
  end
  
  def convert_roman_two_digits(integer)
    case integer
    when 10..30
      'X' * (integer / 10)
    when 40
      'XL'
    when 50..80
      'L' + 'X' * (integer / 10 - 5)
    when 90
      'XC'
    end
  end
  
  def convert_roman_one_digits(integer)
    case integer
    when 1..3
      'I' * integer
    when 4
      'IV'
    when 5..8
      'V' + 'I' * (integer - 5)
    when 9
      'IX'
    end
  end
end

