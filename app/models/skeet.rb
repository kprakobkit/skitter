class Skeet < ActiveRecord::Base
  validates :skeet, length: {
    minimum: 1,
    maximum: 140,
    too_short: "Must have at least %{count} characters.",
    too_long: "Must have at most %{count} characters."
  }

  belongs_to :user
end
