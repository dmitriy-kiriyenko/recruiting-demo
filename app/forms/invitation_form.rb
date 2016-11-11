class InvitationForm
  include ActiveAttr::Model

  attribute :emails
  attribute :folder
  validates :emails, presence: true
  validate :check_emails

  def check_emails
    if emails.present?
      errors.add(:emails, 'should contain valid emails, split with comma') unless email_list.all? {|e| e =~ /\A[^@\s]+@[^@\s]+\z/}
      errors.add(:emails, 'should contain only existing user emails') unless email_list.all? { |e| User.exists?(email: e) }
    end
  end

  def email_list
    emails.split(/,\s+/)
  end

  def invite
    return false unless valid?
    User.where(email: email_list).where.not(id: folder.user_ids).each do |u|
      u.rights.create(folder: folder)
    end
  end
end
