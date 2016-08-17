class Employee < ActiveRecord::Base
  has_many :reports, class_name: "Employee", foreign_key: 'manager_id'
  belongs_to :manager, class_name: "Employee"

  validates :name, presence: true
end
