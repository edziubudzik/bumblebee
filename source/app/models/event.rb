class Event < ActiveRecord::Base
  belongs_to :stage, :polymorphic => true
  belongs_to :demo, :polymorphic => true
end
