class Floorplan < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :project

  validates :image_data, presence: true
  validates :image, presence: true

  def data
    @data
  end
end
