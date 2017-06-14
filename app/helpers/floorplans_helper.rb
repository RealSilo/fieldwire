module FloorplansHelper
  def without_extension(filename)
    File.basename(filename, File.extname(filename))
  end

  def pdf_format?(floorplan)
    floorplan.image.respond_to?(:metadata) && floorplan.image.metadata['mime_type'] == 'application/pdf'
  end

  def filename(floorplan)
    if pdf_format?(floorplan)
      without_extension(floorplan.image.metadata['filename'])
    else
      without_extension(floorplan.image[:original].data['metadata']['filename'])
    end
  end
end
