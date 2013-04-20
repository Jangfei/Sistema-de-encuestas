class Question < ActiveRecord::Base
  attr_accessible :descripcion, :question_type_id, :user_id
end
