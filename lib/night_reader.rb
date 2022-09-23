class NightReader
  attr_reader :filename, :back_to_eng
  
  def initialize
    @filename = ARGV[0]
    @back_to_eng = ARGV[1]
  end
  
  def read_content
    File.read(filename)
  end
  
  def write_content
    File.write(back_to_eng, read_content)
    p "Created '#{back_to_eng}' containing #{read_content.length} characters"
  end
  
  
end

# NightReader.new.write_content
