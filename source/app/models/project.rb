class Project < ActiveRecord::Base
  has_many :blocks
  has_many :stages
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
end
