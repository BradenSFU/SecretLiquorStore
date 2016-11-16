class Drink < ApplicationRecord
  has_and_belongs_to_many :publishes
  has_and_belongs_to_many :likes
end
