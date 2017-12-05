class Transformer
  attr_reader :image

  def initialize
    @image = []
    @matrix = []
  end

  def create_image(line)
    number_of_columns = line.split(' ')[1]
    number_of_rows = line.split(' ')[2]
    @matrix = Array.new(number_of_rows.to_i) { Array.new(number_of_columns.to_i, 'O') }
    join_image
  end

  def colour_pixel(line)
    raise_error_if_image_empty?
    x = line.split(' ')[1]
    y = line.split(' ')[2]
    colour = line.split(' ')[3]
    @matrix[y.to_i - 1][x.to_i - 1] = colour
    join_image
  end

  def colour_vertical(line)
    raise_error_if_image_empty?
    x = line.split(' ')[1]
    y1 = line.split(' ')[2]
    y2 = line.split(' ')[3]
    colour = line.split(' ').last
    y1.to_i.upto(y2.to_i) do |y|
      @matrix[y.to_i - 1][x.to_i - 1] = colour
    end
    join_image
  end

  def colour_horizontal(line)
    raise_error_if_image_empty?
    x1 = line.split(' ')[1]
    x2 = line.split(' ')[2]
    y = line.split(' ')[3]
    colour = line.split(' ').last
    x1.to_i.upto(x2.to_i) do |x|
      @matrix[y.to_i - 1][x.to_i - 1] = colour
    end
    join_image
  end

  def display_image
    puts @image
  end

  def clear_image
    @image.clear
  end

  def unrecognised_command(line)
    puts "#{line} --- unrecognised command :("
  end

  private

  def join_image
    @image = @matrix.map { |row| row.join }
  end

  def raise_error_if_image_empty?
    raise "You must create image first. Try adding the command 'I <columns> <rows>'" if @image.empty?
  end
end
