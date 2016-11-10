class ApplicationMailer < ActionMailer::Base
  self.append_view_path Rails.root.join('app', 'views', 'mailers')

  default from: 'from@example.com'
  layout 'mailer'
end
