require 'rails_helper'

describe Order do
  it { should validate_presence_of :shipping_address }
  it { should validate_presence_of :shipping_date }
  it { should have_many :line_items }
  it { should have_many(:books).through(:line_items) }
  it { should have_many(:videos).through(:line_items) }

  describe "#total" do
    it "find the total of all line_items" do
      line_item = FactoryGirl.create(:line_item)
      order = line_item.order
      rand(3).times { FactoryGirl.create(:line_item, order: order) }

      total = order.line_items.inject(0){|sum, line_item| sum + (line_item.item_price * line_item.quantity)}
      expect(order.total).to eq total
    end
  end
end
