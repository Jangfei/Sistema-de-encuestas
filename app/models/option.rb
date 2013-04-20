class Option < ActiveRecord::Base
  attr_accessible :descripcion, :question_id
  belongs_to :question
  
end
