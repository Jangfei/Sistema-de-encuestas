class Answer < ActiveRecord::Base
  attr_accessible :descripcion, :question_id, :resolved_survey_id
end
