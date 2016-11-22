class Like < ApplicationRecord
  belongs_to :user
  belongs_to :publish

  def self.create_like(publish,current_user)
    like = Like.find_or_initialize_by(:user_id=>current_user.id)
    like.publish_id = publish.id
    if like.islike
      like.destroy
    else
      like.islike = true
      like.save
    end
  end

  def self.create_dislike(publish,current_user)
    like = Like.find_or_initialize_by(:user_id=>current_user.id)
    like.publish_id = publish.id
    if !like.islike
      like.destroy
    else
      like.islike = false
      like.save
    end
  end

  def self.remove_from_likes_list_on_model(publish,current_user)
  end

end
