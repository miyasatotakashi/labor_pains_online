FactoryBot.define do
  factory :user do
    factory :user_1 do
      name { "taro" }
      email { "sample@example.com" }
      password { "password"}
      encrypted_password { "password" }
    end
  end
end