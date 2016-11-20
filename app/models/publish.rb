class Publish < ApplicationRecord
  belongs_to :user
  validates :Rname, :ingredients, :instructions, :presence => true
  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  private
    def image_size_validation
      errors[:image] << "should be less than 2.5MB" if image.size > 2.5.megabytes
    end
end