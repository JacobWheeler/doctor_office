class Doctor < ApplicationRecord
  validates_presence_of :name, :description

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

end
