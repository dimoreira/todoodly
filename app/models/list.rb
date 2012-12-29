class List < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates_presence_of :name
  
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
