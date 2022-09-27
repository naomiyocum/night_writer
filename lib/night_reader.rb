require_relative 'dictionary'

class NightReader < Dictionary
  attr_reader :filename, :back_to_eng
  
  def initialize
    @filename = ARGV[0]
    @back_to_eng = ARGV[1]
  end
  
  def read_content
    File.read(filename).strip
  end
  
  def write_content
    File.write(back_to_eng, to_english(read_content))
    p "Created '#{back_to_eng}' containing #{read_content.length} characters"
  end
  
  def split_to_lines(content)
    lines = content.split("\n")
    lines.delete("")
    split_lines = lines.each_slice(3).map {|threes| threes}
  end
  
  def split_to_letters(content)
    lines = split_to_lines(content)
    full_doc = lines.map {|b_line| b_line.map {|line| line.chars.each_slice(2).map(&:join)}}
  end
  
  def connecting_letters(content)
    full_letter = []
    split_to_letters(content).each do |b_lines|
      index = 0
      dots = b_lines[0].length
      dots.times do
        full_letter << b_lines.map {|letter| letter[index]}
        index += 1
      end
    end
    full_letter
  end
  
  def to_english(content)
    connecting_letters(content).map {|letter| english[letter]}.join('')
  end
end

NightReader.new.write_content
