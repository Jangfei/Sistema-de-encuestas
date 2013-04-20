class Answer < ActiveRecord::Base
  attr_accessible :descripcion, :question_id, :resolved_survey_id
  belongs_to :resolved_survey
  belongs_to :question
  
end
