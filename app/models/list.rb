class List < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates_presence_of :name
  
  has_many :tasks
end
