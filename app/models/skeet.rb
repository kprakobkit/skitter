class Skeet < ActiveRecord::Base
  validates :skeet, length: {
    minimum: 1,
    maximum: 140,
    too_short: "Must have at least %{count} characters.",
    too_long: "Must have at most %{count} characters."
  }

  belongs_to :user
  belongs_to :author, :class_name => "User"
  after_initialize :set_author

  private
  
  def set_author
    self.author_id = self.user_id unless self.reskeet
  end
end
