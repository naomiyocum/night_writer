class NightWriter
  attr_reader :filename, :translated_file
  
  def initialize
    @filename = ARGV[0]
    @translated_file = ARGV[1]
  end
  
  def read_content
    File.read(filename).strip
  end
  
  def write_content
    File.write(translated_file, to_braille(read_content))
    p "Created '#{translated_file}' containing #{read_content.length} characters"
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
    
    array1 = line1.chars.each_slice(80).map{|eighties| eighties}
    array2 = line2.chars.each_slice(80).map{|eighties| eighties}
    array3 = line3.chars.each_slice(80).map{|eighties| eighties}
    
    count = 0
    amount_of_lines = array1.count
    full_doc = []
    
    until count == amount_of_lines
      full_doc << array1[count].join
      full_doc << array2[count].join
      full_doc << array3[count].join
      count += 1
    end
    full_doc.join("\n")
  end
end

# NightWriter.new.write_content
