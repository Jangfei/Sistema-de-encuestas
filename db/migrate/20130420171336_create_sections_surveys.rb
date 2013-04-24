class CreateSectionsSurveys < ActiveRecord::Migration
def change
    create_table :sections_surveys, :id => false do |t|
      t.integer :survey_id
      t.integer :section_id

    end
    
     add_index(:sections_surveys, [:survey_id, :section_id], :unique => true)
  end

end
