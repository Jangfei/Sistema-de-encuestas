class QuestionType < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :questions
  
end
