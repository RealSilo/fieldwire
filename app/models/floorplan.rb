class Floorplan < ApplicationRecord
  attr_reader :data
  include ImageUploader[:image]
  belongs_to :project

  validates :image_data, presence: true
  validates :image, presence: true
end
