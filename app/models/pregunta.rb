class Pregunta < ActiveRecord::Base
  attr_accessible :text, :tipo_pregunta_id
  
  validates :text, :presence => true
  
end
