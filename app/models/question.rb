class Question < ActiveRecord::Base
  attr_accessible :descripcion, :question_type_id, :user_id
  has_many :answers
  has_many :options
  belongs_to :question_type
  belongs_to :user
  has_and_belongs_to_many :sections

validates :descripcion, :presence => true
>> p = Question.new
=> #<Question id: nil, name: nil>
>> p.errors
=> {}
>> p.valid?
=> false
>> p.errors
=> {:descripcion=>["no puede estar en blanco"]}
 
>> p = Question.create
=> #<Question id: nil, name: nil>
>> p.errors
=> {:descripcion=>["no puede estar en blanco"]}
 
>> p.save
=> false
 
>> p.save!
=> ActiveRecord::RecordInvalid: Validation failed: Descripcion no puede estar en blanco
 
>> Question.create!
=> ActiveRecord::RecordInvalid: Validation failed: Descripcion no puede estar en blanco
end

