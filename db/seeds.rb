10.times do
  user = User.create(username: Faker::Internet.user_name, password: "password")
  5.times { user.skeets.create(skeet: Faker::Company.catch_phrase) }
end
