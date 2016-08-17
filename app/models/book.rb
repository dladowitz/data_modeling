class Book < ActiveRecord::Base
  belongs_to :author
  validates :author, :title, presence: true
end
