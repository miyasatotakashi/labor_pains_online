5.times do |i|
  User.create!(name: "user_#{i}",
  email: "sample_#{i}@example.com",
  password: "password",
  encrypted_password: "password")
end