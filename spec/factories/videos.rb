FactoryGirl.define do
  factory :video do
    name FFaker::Skill.tech_skill
    length { rand(10..100) }
  end
end
