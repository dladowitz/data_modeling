class Order < ActiveRecord::Base
  has_many :line_items
  has_many :books, through: :line_items, class_name: Book
  has_many :videos, through: :line_items, class_name: Video

  validates :shipping_date, :shipping_address, presence: true
end
