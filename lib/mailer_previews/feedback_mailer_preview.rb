class UsersMailerPreview < ActionMailer::Preview
  # NOTE: To make this route work you should comment global interception in routes.rb
  # Because rails 4.1 does not allow use global interception with preview
  # This behavior is fixed in Rails 4.2.
  #
  # http://localhost:3000/rails/mailers/users_mailer/folder_deleted
  def folder_deleted
    email = User.pluck(:email).sample
    folder_name = 'Some folder name'

    UsersMailer.folder_deleted(email, folder_name)
  end

end
