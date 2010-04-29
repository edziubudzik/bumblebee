class Page < ActiveRecord::Base
  versioned
  
  belongs_to :project
  belongs_to :user
end
