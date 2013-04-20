class Section < ActiveRecord::Base
  attr_accessible :nombre, :user_id
  belongs_to :user
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :questions
  
end
