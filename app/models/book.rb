class Book < ActiveRecord::Base
  belongs_to :author
  has_many :chapters, dependent: :destroy
  validates :author, :title, presence: true
end
