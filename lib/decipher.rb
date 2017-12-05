module Decipher
  def self.choose_task(line)
    case
    when line.start_with?('I')
      'create_image'
    when line.start_with?('L')
      'colour_pixel'
    when line.start_with?('V')
      'colour_vertical'
    when line.start_with?('H')
      'colour_horizontal'
    when line == 'S'
      'display_image'
    when line == 'C'
      'clear_image'
    else
      puts 'unrecognised command :('
    end
  end
end
