class UserQset < ApplicationRecord
  belongs_to :user
  belongs_to :qset
end
