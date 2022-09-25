require_relative 'dictionary'

class NightWriter < Dictionary
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
  
  def split_string(content)
    content.strip.split('')
  end

  def to_braille(content)
    line1 = split_string(content).map {|letter| braille[letter][0]}.join
    line2 = split_string(content).map {|letter| braille[letter][1]}.join
    line3 = split_string(content).map {|letter| braille[letter][2]}.join
    
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
