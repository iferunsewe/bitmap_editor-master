class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp

      Decipher.go(line)

    end
  end

  def display(bitmap)

  end
end
