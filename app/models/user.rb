class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates :email, presence: true,
                    uniqueness: { allow_blank: true },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, allow_blank: true }

  validates :password, presence: true,
                       confirmation: { allow_blank: true }

  def username
    email.split('@').first
  end
end
