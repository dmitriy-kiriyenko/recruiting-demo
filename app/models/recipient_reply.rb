class RecipientReply < ApplicationRecord
  has_many :recipient_answers

  belongs_to :survey
  belongs_to :user
  belongs_to :owner, class_name: 'User'

  accepts_nested_attributes_for :recipient_answers

  def start!
    return nil if self.start_at

    self.update_attributes(start_at: DateTime.current)
  end

  def finish_at
    return nil unless self.start_at
    self.start_at + 1.hour
  end

  def is_finished?
    return nil unless self.finish_at

    DateTime.current > self.finish_at
  end
end
