class Question < ActiveRecord::Base
  attr_accessible :descripcion, :question_type_id, :user_id
  has_many :answers
  has_many :options
  belongs_to :question_type
  belongs_to :user
  has_and_belongs_to_many :sections

validates :descripcion, :presence => true
end

