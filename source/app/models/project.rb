class Project < ActiveRecord::Base
  has_many :blocks
  has_many :stages
end
