class Project < ApplicationRecord
  belongs_to :user
  has_many :floorplans

  validates :name, presence: true
end
