class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :publish, dependent: :destroy

  def self.create_like(current_user)
    like = Like.find_or_initialize_by(:user_id=>current_user.id)
    if like.islike
      like.destroy
    else
      like.islike = true
      like.save
    end
  end

  def self.create_dislike(current_user)
    like = Like.find_or_initialize_by(:user_id=>current_user.id)
     if like.islike == false
       like.destroy
     else
       like.islike = false
       like.save
     end
   end

end
