class EmploymentHistory < ActiveRecord::Base
  # belongs_to :employee
  validates :employee_id, uniqueness: true
  has_one :hiring_record
end
