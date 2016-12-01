class Like < ApplicationRecord
  belongs_to :user
  belongs_to :publish

=begin
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
=end

  def self.create_vote(publish,current_user,vote)
    like = Like.new
    like.publish_id = publish.id
    like.user_id = current_user.id
    like.islike = vote
    like.save
  end

  def self.remove_from_likes_list_on_model(publish,current_user)
    Like.where(:publish_id => publish.id, :user_id => current_user.id).destroy_all
  end

end
