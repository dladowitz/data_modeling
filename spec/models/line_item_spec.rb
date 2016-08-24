require 'rails_helper'

describe LineItem do
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :item_price }
  it { should belong_to :order }
  it { should belong_to :purchasable }
end
