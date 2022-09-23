class NightWriter

  def translate_content
    content = File.read(ARGV[0]) if ARGV[0] == 'message.txt'
    char_length = content.length if ARGV[0] == 'message.txt'
    
    content = to_braille(content) if ARGV[0] == 'message.txt'
    File.write(ARGV[1], content) if ARGV[0] == 'message.txt'

    puts "Created '#{ARGV[1]}' containing #{char_length} characters"
  end

  def b_lc_alphabet
    braille = {
    'a' => [["0."],[".."],[".."]],
    'b' => [["0."],["0."],[".."]],
    'c' => [["00"],[".."],[".."]],
    'd' => [["00"],[".0"],[".."]],
    'e' => [["0."],[".0"],[".."]],
    'f' => [["00"],["0."],[".."]],
    'g' => [["00"],["00"],[".."]],
    'h' => [["0."],["00"],[".."]],
    'i' => [[".0"],["0."],[".."]],
    'j' => [[".0"],["00"],[".."]],
    'k' => [["0."],[".."],["0."]],
    'l' => [["0."],["0."],["0."]],
    'm' => [["00"],[".."],["0."]],
    'n' => [["00"],[".0"],["0."]],
    'o' => [["0."],[".0"],["0."]],
    'p' => [["00"],[".0"],["0."]],
    'q' => [["00"],["00"],["0."]],
    'r' => [["0."],["00"],["0."]],
    's' => [[".0"],["0."],["0."]],
    't' => [[".0"],["00"],["0."]],
    'u' => [["0."],[".."],["00"]],
    'v' => [["0."],["0."],["00"]],
    'w' => [[".0"],["00"],[".0"]],
    'x' => [["00"],[".."],["00"]],
    'y' => [["00"],[".0"],["00"]],
    'z' => [["0."],[".0"],["00"]],
    ' ' => [[".."],[".."],[".."]]
  }
  end
  
  def to_braille(content)
    chars = content.strip.split('')
    line1 = chars.map {|letter| b_lc_alphabet[letter][0]}.join
    line2 = chars.map {|letter| b_lc_alphabet[letter][1]}.join
    line3 = chars.map {|letter| b_lc_alphabet[letter][2]}.join
    
    array1 = line1.chars.each_slice(40).map{|fortys| fortys}
    array2 = line2.chars.each_slice(40).map{|fortys| fortys}
    array3 = line3.chars.each_slice(40).map{|fortys| fortys}
    
    count = 0
    amount_of_lines = array1.count
    
    until count == amount_of_lines
      puts "#{array1[count].join}\n#{array2[count].join}\n#{array3[count].join}"
      count += 1
    end
    
    # 
    # require 'pry';binding.pry
    # 
    # "#{line1}\n#{line2}\n#{line3}"
  end
end

NightWriter.new.translate_content
