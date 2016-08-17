class Book < ActiveRecord::Base
  belongs_to :author
  has_many :chapters
  validates :author, :title, presence: true
end
