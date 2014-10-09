require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, uniqueness: true, presence: true
  has_many :skeets

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end