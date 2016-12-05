class Publish < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients

  validates :name, :instructions, :presence => true, :uniqueness => true
  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  def add_like(user)
    self.create_vote(user,true)
  end

  def add_dislike(user)
    self.create_vote(user,false)
  end

  def create_vote(user,vote)
    new_vote = Like.new
    new_vote.islike = vote
    user.likes << new_vote
    self.likes << new_vote
    new_vote.save
  end

  def delete_vote(user)
    self.delete_the_vote
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 2.5MB" if image.size > 2.5.megabytes
    end
end
