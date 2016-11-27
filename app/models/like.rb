class Like < ApplicationRecord
  belongs_to :user
  belongs_to :publish

=begin
    like = Like.find_or_initialize_by(:user_id=>current_user.id)
    like.publish_id = publish.id
    if !like.islike
      like.destroy
    else
      like.islike = false
      like.save
    end
=end

  def self.create_vote(publish,user,vote)
    onevote = Like.new
    onevote.islike = vote
    onevote.publish_id = publish.id
    onevote.user_id = user.id
    onevote.save
  end

  def self.remove_from_likes_list_on_model(publish,current_user)
    Like.where(user_id: current_user.id, publish_id: publish.id).destroy_all
  end

end
