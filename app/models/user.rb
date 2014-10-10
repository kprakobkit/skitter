require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, uniqueness: true, presence: true

  has_many :skeets
  has_many :followers, through: :follower_follows, source: :follower
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followees, through: :followee_follows, source: :followee
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"

  def first_skeet
    self.skeets.create(skeet: "This is my first skeet!")
  end

  def get_all_skeets
    all_skeets = self.followees.map do |followee|
      followee.skeets.map { |skeet| skeet }
    end.flatten
    all_skeets.sort_by { |skeet| skeet.created_at }.reverse!
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
