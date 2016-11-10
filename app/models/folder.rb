class Folder < ApplicationRecord
  validates :name, presence: true

  has_many :images, dependent: :destroy

  has_many :rights, dependent: :destroy
  has_many :users, through: :rights

  def delete_folder!
    user_emails = self.users.pluck(:email)

    self.destroy

    user_emails.each do |email|
      UsersMailer.folder_deleted(email, self.name).deliver_now
    end
  end
end
