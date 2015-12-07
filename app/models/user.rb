class User < ActiveRecord::Base
  has_secure_password

  has_many :tweets



EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
validates :first_name, presence: true, length: {maximum:25}
validates :last_name, presence: true, length:{maximum:50}
validates :email, presence: true, length:{maximum:100}, format: EMAIL_REGEX, confirmation: true, uniqueness: true
validates :username, presence: true, length:{within:8..25}, uniqueness: true, format: USERNAME_REGEX
before_save :downcase_fields

def downcase_fields
  self.username.downcase!
  self.email.downcase!
end


end
