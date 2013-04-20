class CreateSectionsSurveys < ActiveRecord::Migration
def change
    create_table :sections_surveys do |t|
      t.integer :survey_id
      t.integer :section_id

      t.timestamps
    end
  end

end
