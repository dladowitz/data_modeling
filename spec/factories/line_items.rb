
FactoryGirl.define do
  factory :line_item do
    association :order
    association :purchasable, :factory => [:book, :video].sample #not actually sampling for some reason
    quantity { rand(1..5) }
    item_price { rand(100..2000) }
  end
end
