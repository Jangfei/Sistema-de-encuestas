class ResolvedSurvey < ActiveRecord::Base
  attr_accessible :fecha_resolucion, :question_id
  belongs_to :survey
  has_many :answers
  
  
end
