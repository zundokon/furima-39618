FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthdate {'1930-01-01'}
    first_name{'山田'}
    last_name{'太郎'}
    kana_first{'ヤマダ'}
    kana_last{'タロウ'}
  end
end