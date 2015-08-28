# 10.times do
  User.create(email: Faker::Internet.email, password_digest: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
# end
