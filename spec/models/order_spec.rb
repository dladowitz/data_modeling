require 'rails_helper'

describe Order do
  it { should validate_presence_of :shipping_address }
  it { should validate_presence_of :shipping_date }
  it { should have_many :line_items }
  it { should have_many(:books).through(:line_items) }
  it { should have_many(:videos).through(:line_items) }

end
