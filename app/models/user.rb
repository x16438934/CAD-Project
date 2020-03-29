class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email = email.downcase}
# getting validations for user
validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimun: 3, maximum: 25}

# getting validations for email
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

has_secure_password
def self.search(param)
  param.strip!
  to_send_back = username_matches(param) + email_matches(param).uniq
  return nil unless to_send_back
  to_send_back 
end

def self.username_matches(param)
matches('username', param)
end

def self.email_matches(param)
matches('email', param)
end

def self.matches(field_name, param)
  where("#{field_name} like ?", "%#{param}%")
end

end
