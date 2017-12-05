require_relative 'line'
require_relative 'transformer'

class BitmapEditor
  def initialize
    @transformer = Transformer.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = Line.new(line.chomp)
      return puts line.reason_for_failure unless line.valid?
      line_text = line.text
      task = line.task
      if task == 'display_image' || task == 'clear_image'
        @transformer.send(task)
      else
        @transformer.send(task, line_text)
      end
    end
  end
end
