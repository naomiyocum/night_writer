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
  
  def split_lines(content)
    line1 = split_string(content).map {|letter| braille[letter][0]}.join
    line2 = split_string(content).map {|letter| braille[letter][1]}.join
    line3 = split_string(content).map {|letter| braille[letter][2]}.join
    
    arr_of_lines = []
    arr_of_lines << line1.chars.each_slice(80).map{|eighties| eighties}
    arr_of_lines << line2.chars.each_slice(80).map{|eighties| eighties}
    arr_of_lines << line3.chars.each_slice(80).map{|eighties| eighties}
    arr_of_lines
  end

  def to_braille(content)
    count = 0
    full_doc = []
    arr_lines = split_lines(content)
    until count == arr_lines[0].count
      full_doc << arr_lines[0][count].join
      full_doc << arr_lines[1][count].join
      full_doc << arr_lines[2][count].join
      count += 1
    end
    full_doc.join("\n")
  end
end

NightWriter.new.write_content
