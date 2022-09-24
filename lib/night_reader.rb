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
  
  def br_to_eng_dic
    english = {
    [["0."],[".."],[".."]]=>"a",
    [["0."],["0."],[".."]]=>"b",
    [["00"],[".."],[".."]]=>"c",
    [["00"],[".0"],[".."]]=>"d",
    [["0."],[".0"],[".."]]=>"e",
    [["00"],["0."],[".."]]=>"f",
    [["00"],["00"],[".."]]=>"g",
    [["0."],["00"],[".."]]=>"h",
    [[".0"],["0."],[".."]]=>"i",
    [[".0"],["00"],[".."]]=>"j",
    [["0."],[".."],["0."]]=>"k",
    [["0."],["0."],["0."]]=>"l",
    [["00"],[".."],["0."]]=>"m",
    [["00"],[".0"],["0."]]=>"p",
    [["0."],[".0"],["0."]]=>"o",
    [["00"],["00"],["0."]]=>"q",
    [["0."],["00"],["0."]]=>"r",
    [[".0"],["0."],["0."]]=>"s",
    [[".0"],["00"],["0."]]=>"t",
    [["0."],[".."],["00"]]=>"u",
    [["0."],["0."],["00"]]=>"v",
    [[".0"],["00"],[".0"]]=>"w",
    [["00"],[".."],["00"]]=>"x",
    [["00"],[".0"],["00"]]=>"y",
    [["0."],[".0"],["00"]]=>"z",
    [[".."],[".."],[".."]]=>" "}
  end
  
  def to_english(content)
    lines = content.split("\n")
    
    # array = []
    # lines.map {|line| array << [line]}
    # braille_split = array.map {|line| line.first.scan(/../)}
  end
  
  
end

# NightReader.new.write_content
