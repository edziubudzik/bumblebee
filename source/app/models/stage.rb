class Stage < ActiveRecord::Base
  belongs_to :project
  belongs_to :stage_type
  
  has_and_belongs_to_many :blocks
  has_many :block_stages
  
  has_many :events, :as => :eventable
end
