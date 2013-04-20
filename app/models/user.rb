class User < ActiveRecord::Base
  attr_accessible :apellido, :ciudad, :fecha_nac, :nombre, :password, :profile_id, :user_name
end
