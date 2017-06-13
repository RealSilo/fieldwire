require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :validation_helpers
  include ImageProcessing::MiniMagick
  include ImageUploader[:image]
  plugin :processing
  plugin :versions

  Attacher.validate do
    validate_max_size 10*1024*1024, message: 'is too large (max is 10 MB)'
    validate_mime_type_inclusion %w[application/pdf image/jpeg image/jpg image/png]
  end

  process(:store) do |io, _context|
    unless io.mime_type == 'application/pdf'
      original = io.download

      size_200 = resize_to_limit!(original, 200, 200)
      size_100 = resize_to_limit(size_200,  100, 100)

      { original: io, medium: size_200, small: size_100 }
    end
  end
end
