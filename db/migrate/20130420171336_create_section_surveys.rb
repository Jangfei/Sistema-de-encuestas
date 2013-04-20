class CreateSectionSurveys < ActiveRecord::Migration
def change
    create_table :section_surveys do |t|
      t.integer :survey_id
      t.integer :section_id

      t.timestamps
    end
  end

end
