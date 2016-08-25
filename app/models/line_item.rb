class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :purchasable, polymorphic: true
  validates :quantity, :item_price, presence: true

  def name_or_title
    if purchasable_type == "Book"
      purchasable.title
    else
      purchasable.name
    end
  end

  def total
    (quantity * item_price) / 100
  end
end
