class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id
  
  belongs_to :list
  
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :positioned, order('position ASC')
end
