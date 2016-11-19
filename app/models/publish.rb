class Publish < ApplicationRecord
  belongs_to :user
  validates :Rname, :ingredients, :instructions, :presence => true
end
