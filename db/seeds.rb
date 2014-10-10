10.times do
  user = User.create(
    username: Faker::Internet.user_name,
    password: "password",
    name: Faker::Name.first_name,
    state: Faker::Address.state,
    city: Faker::Address.city,
    email: "default@email.com",
    bio: "default bio info"
  )

  5.times { user.skeets.create(skeet: Faker::Company.catch_phrase) }
end

all_users = User.all
User.all.each do |user|
  user.followers << all_users.sample(5)
  user.save
end
