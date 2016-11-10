class UsersMailer < ApplicationMailer

  def folder_deleted(email, folder_name)
    @folder_name = folder_name
    @email = email

    mail(to: email, subject: 'Folder was deleted')
  end

end
