class DemoActivity < ActiveRecord::Base
  belongs_to :demo
  belongs_to :user
  
  validates_presence_of :method, :url
  validates_inclusion_of :method, :in => %w[get post put delete]
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
