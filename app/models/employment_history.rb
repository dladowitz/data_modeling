class EmploymentHistory < ActiveRecord::Base
  # belongs_to :employee
  validates :employee_id, uniqueness: true
end
