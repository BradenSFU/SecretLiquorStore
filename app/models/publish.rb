class Publish < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients

  validates :name, :instructions, :presence => true, :uniqueness => true
  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  private
    def image_size_validation
      errors[:image] << "should be less than 2.5MB" if image.size > 2.5.megabytes
    end
end
