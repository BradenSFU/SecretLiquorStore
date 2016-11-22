class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
