class Author < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_many :chapters, through: :books
  validates :name, presence: true
end
