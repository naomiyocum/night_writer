class NightReader
  def translate_content
    content = File.read(ARGV[0]) if ARGV[0] == 'braille.txt'
    char_length = content.length if ARGV[0] == 'braille.txt'
    
    File.write(ARGV[1], content) if ARGV[0] == 'braille.txt'

    puts "Created '#{ARGV[1]}' containing #{char_length} characters"
  end
end

NightReader.new.translate_content
