class Profile < ActiveRecord::Base
  attr_accessible :tipo
  has_many :users
  
end
