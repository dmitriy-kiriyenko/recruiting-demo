class Comment < ApplicationRecord
  has_many :comments, as: :commentable

  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  after_commit :broadcast_notification, on: :create

  def broadcast_notification
    User.where.not(id: self.user_id).each do |user|
      ActionCable.server.broadcast "comment_created_for_#{user.id}", message: self.body
    end
  end
end
