class Section < ActiveRecord::Base
  attr_accessible :nombre, :user_id, :survey_ids, :question_ids
  belongs_to :user
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :questions
  

validates :nombre, :presence => true

end
