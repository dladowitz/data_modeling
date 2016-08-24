class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :purchasable, polymorphic: true
  validates :quantity, :item_price, presence: true
end
