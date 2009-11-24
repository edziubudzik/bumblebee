class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :block_type
end
