class ResolvedSurvey < ActiveRecord::Base
  
  attr_accessible :fecha_resolucion, :question_id, :answers_attributes
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  
end
