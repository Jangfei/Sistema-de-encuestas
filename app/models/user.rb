class User < ActiveRecord::Base
  attr_accessible :apellido, :ciudad, :fecha_nac, :nombre, :password, :profile_id, :user_name
  belongs_to :profile
  has_many :surveys
  has_many :questions
  has_many :sections
  
  
end
