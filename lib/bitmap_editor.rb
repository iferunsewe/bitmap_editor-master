require_relative 'decipher'
require_relative 'transformer'

class BitmapEditor
  def initialize
    @transformer = Transformer.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      task = Decipher.choose_task(line)
      if task == 'display_image' || task == 'clear_image'
        @transformer.send(task)
      else
        @transformer.send(task, line)
      end
    end
  end
end
