class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :surveys
  has_many :question_responses

  validates_presence_of :password_digest, :email, :first_name
  validates_uniqueness_of :email

  # add kelly's cool email validation
end
