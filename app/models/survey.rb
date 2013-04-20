class Survey < ActiveRecord::Base
  attr_accessible :fecha_creacion, :nombre_encuesta, :user_id
end
