class User < ApplicationRecord
  has_many :orders
  
  has_secure_password
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true
  validate :password_complexity

  def password_complexity
    if password.present?
      if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/) 
        errors.add :password, "Password complexity requirement not met"
      end
    end
  end
end
