class Book < ActiveRecord::Base
  belongs_to :author
  validates :author, :title, presense: true
end
