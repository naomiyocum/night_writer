class NightWriter

  def translate_content
    content = File.read(ARGV[0]) if ARGV[0] == 'message.txt'
    char_length = content.length if ARGV[0] == 'message.txt'
    File.write(ARGV[1], content) if ARGV[0] == 'message.txt'

    puts "Created '#{ARGV[1]}' containing #{char_length} characters"
  end
end

NightWriter.new.translate_content
