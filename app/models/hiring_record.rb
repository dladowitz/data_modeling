class HiringRecord < ActiveRecord::Base
  # belongs_to :employment_history
  validates :employment_history_id, uniqueness: true
end
