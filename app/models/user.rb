class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 8}
  validate :passwords_match
  validates :email, uniqueness: true

  def self.authenticate_with_credentials email, password
    
    # success logic, log them in
    user = User.find_by_email(email.strip.downcase)
    
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
    def passwords_match
      if password != password_confirmation
        errors.add(:password_confirmation, "password confirmation field must be the same as password field")
      end
    end
end
