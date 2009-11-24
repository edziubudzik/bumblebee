class Stage < ActiveRecord::Base
  belongs_to :project
  belongs_to :stage_type
end
