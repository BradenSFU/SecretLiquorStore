class Like < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :drinks
end
