FactoryBot.define do
  factory :pokemon do
    association :types

    name { 'bulbasaur' }
    weight { 69 }
    height { 7 }
  end
end
