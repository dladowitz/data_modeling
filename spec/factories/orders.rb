FactoryGirl.define do
  factory :order do
    shipping_address FFaker::AddressUS.street_address
    shipping_date 2.days.from_now
  end
end
