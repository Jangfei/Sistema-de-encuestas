class Question < ActiveRecord::Base
  attr_accessible :descripcion, :question_type_id, :user_id
  has_many :answers
  has many :options
  belongs_to :question_type
  belongs_to :user
  
end
