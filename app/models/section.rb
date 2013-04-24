class Section < ActiveRecord::Base
  attr_accessible :nombre, :user_id
  belongs_to :user
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :questions
  

validates :nombre, :presence => true
>> p = Section.new
=> #<Section id: nil, name: nil>
>> p.errors
=> {}
>> p.valid?
=> false
>> p.errors
=> {:nombre=>["no puede estar en blanco"]}
 
>> p = Section.create
=> #<Section id: nil, name: nil>
>> p.errors
=> {:nombre=>["no puede estar en blanco"]}
 
>> p.save
=> false
 
>> p.save!
=> ActiveRecord::RecordInvalid: Validation failed:  Nombre no puede estar en blanco
 
>> Section.create!
=> ActiveRecord::RecordInvalid: Validation failed: Nombre no puede estar en blanco


end
