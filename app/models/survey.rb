class Survey < ActiveRecord::Base
  attr_accessible :fecha_creacion, :nombre_encuesta, :user_id, :section_ids
  belongs_to :user
  has_many :resolved_surveys
  has_and_belongs_to_many :sections
  
end
