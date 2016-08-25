FactoryGirl.define do
  factory :book do
    author
    title FFaker::Skill.tech_skill
  end
end
