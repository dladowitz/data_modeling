class Book < ActiveRecord::Base
  belongs_to :author
  has_many :chapters, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :line_items, as: :purchasable
  validates :author, :title, presence: true
end
