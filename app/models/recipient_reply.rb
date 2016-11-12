class RecipientReply < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  belongs_to :owner, class_name: 'User'
end
