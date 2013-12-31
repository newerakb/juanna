FactoryGirl.define do
  factory :user do
    name     "Kriven"
    email    "kriven@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
