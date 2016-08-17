class Video < ActiveRecord::Base
  # belongs_to :director
  has_many :reviews, as: :reviewable
  validates :name, presence: true
end
