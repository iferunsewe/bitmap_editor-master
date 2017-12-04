require_relative 'transformer'

class Decipher
  def initialize
    @transformer = Transformer.new
  end

  def choose_task(line)
    case
    when choose_create_image?(line)
      number_of_columns = line.split(' ')[1]
      number_of_rows = line.split(' ')[2]
      @transformer.create_image(number_of_columns, number_of_rows)
    when choose_colour_pixel?(line)
      x = line.split(' ')[1]
      y = line.split(' ')[2]
      colour = line.split(' ')[3]
      @transformer.colour_pixel(colour, x, y)
    when choose_colour_vertical?(line)
      x = line.split(' ')[1]
      y1 = line.split(' ')[2]
      y2 = line.split(' ')[3]
      colour = line.split(' ').last
      @transformer.colour_vertical(colour, x, y1, y2)
    when choose_colour_horizontal?(line)
      x1 = line.split(' ')[1]
      x2 = line.split(' ')[2]
      y = line.split(' ')[3]
      colour = line.split(' ').last
      @transformer.colour_horizontal(colour, x1, x2, y)
    when choose_display_image?(line)
      puts @transformer.image
    when choose_clear_image?(line)
      @transformer.clear_image
    else
      puts 'unrecognised command :('
    end
  end


  private

  def choose_create_image?(line)
    display_if_condition_met(line.start_with?('I'), 'Creating image')
  end

  def choose_colour_pixel?(line)
    display_if_condition_met(line.start_with?('L'), 'Colouring pixel')
  end

  def choose_colour_vertical?(line)
    display_if_condition_met(line.start_with?('V'), 'Colouring vertical')
  end

  def choose_colour_horizontal?(line)
    display_if_condition_met(line.start_with?('H'), 'Colouring horizontal')
  end

  def choose_display_image?(line)
    display_if_condition_met(line == 'S', 'Displaying image')
  end

  def choose_clear_image?(line)
    display_if_condition_met(line == 'C', 'Clearing image')
  end

  def display_if_condition_met(condition, message)
    puts message if condition
    condition
  end
end
