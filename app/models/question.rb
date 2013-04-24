class Question < ActiveRecord::Base
  attr_accessible :descripcion, :question_type_id, :user_id, :section_ids
  has_many :answers, :dependent => :destroy
  has_many :options, :dependent => :destroy
  belongs_to :question_type
  belongs_to :user
  has_and_belongs_to_many :sections

validates :descripcion, :presence => true
end

