class Restaurant < ActiveRecord::Base

  validates :name, :presence => true
  has_many :visits


end
