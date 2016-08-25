class Order < ActiveRecord::Base
  has_many :line_items
  has_many :books, through: :line_items, class_name: Book
  has_many :videos, through: :line_items, class_name: Video

  validates :shipping_date, :shipping_address, presence: true

  def total
    (line_items.inject(0){ |sum, line_item| sum + (line_item.item_price * line_item.quantity) }) / 100
  end

  def human_ship_date
    shipping_date.strftime("%b %d, %Y")
  end

  def all_item_names
    item_names = line_items.map{ |line_item| line_item.name_or_title }
    item_names.join ", "
  end
end
