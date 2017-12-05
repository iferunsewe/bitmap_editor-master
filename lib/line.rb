require_relative 'decipher'

class Line
  attr_reader :text, :task, :reason_for_failure

  def initialize(text)
    @text = text
    @reason_for_failure = ''
    @task = valid? ? decipher_task : ''
  end

  def valid?
    starts_with_capital_letter? &&
      coordinates_are_between_correct_range? &&
      commands_are_valid? &&
      command_properties_are_valid?
  end

  private

  def starts_with_capital_letter?
    condition = @text =~ /^[A-Z]/
    @reason_for_failure = 'The line does not begin with a capital letter' unless condition
    condition
  end

  def coordinates_are_between_correct_range?
    condition = @text.scan(/\d+/).map do |int|
      int.to_i.between?(1, 250)
    end.all?
    @reason_for_failure = 'Coordinates are not between correct range' unless condition
    condition
  end

  def commands_are_valid?
    condition = %w(I L V H S C).include?(@text[0])
    @reason_for_failure = "#{@text[0]} is an unrecognised command :(" unless condition
    condition
  end

  def command_properties_are_valid?
    if @text == 'S' || @text == 'C'
      true
    elsif @text.start_with?('I')
      correct_number_of_characters?(3) &&
        correct_number_of_coordinates?(2)
    elsif @text.start_with?('L')
      correct_number_of_characters?(4) &&
        correct_number_of_coordinates?(2)
    elsif @text.start_with?('V') || @text.start_with?('H')
      correct_number_of_characters?(5) &&
        correct_number_of_coordinates?(3)
    else
      @reason_for_failure = 'Command properties are not valid'
      false
    end
  end

  def decipher_task
    Decipher.choose_task(@text)
  end

  def correct_number_of_characters?(n)
    condition =  @text.split(' ').count == n
    @reason_for_failure = "Wrong number of characters for task: #{decipher_task}" unless condition
    condition
  end

  def correct_number_of_coordinates?(n)
    condition = @text.scan(/\d+/).count == n
    @reason_for_failure = "Wrong number of coordinates for task: #{decipher_task}" unless condition
    condition
  end
end