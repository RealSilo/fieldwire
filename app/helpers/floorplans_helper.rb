module FloorplansHelper
  def without_extension(filename)
    File.basename(filename, File.extname(filename))
  end
end