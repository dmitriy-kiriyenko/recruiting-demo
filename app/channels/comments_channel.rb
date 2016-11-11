class CommentsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "comment_created_for_#{current_user.id}"
  end

end
