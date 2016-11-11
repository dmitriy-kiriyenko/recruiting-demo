class Folder::Delete
  def self.call(folder)
    user_emails = folder.users.pluck(:email)

    folder.destroy

    user_emails.each do |email|
      UsersMailer.folder_deleted(email, folder.name).deliver_now
    end
  end
end
