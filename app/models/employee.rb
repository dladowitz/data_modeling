class Employee < ActiveRecord::Base
  has_many :reports, class_name: "Employee", foreign_key: 'manager_id'
  belongs_to :manager, class_name: "Employee"
  has_one :employment_history

  validates :name, presence: true
end
