FactoryBot.define do
  factory :first_user, class: User do
    name { "user1" }
    email { "user1@sample.com" }
    password { "111111" }

  end

  factory :second_user, class: User do
    name { "user2" }
    email { "user2@sample.com" }
    password { "222222" }
  end

  factory :third_user, class: User do
    name { "user3" }
    email { "user3@sample.com" }
    password { "333333" }

  end
    
  
end