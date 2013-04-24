class CreateResolvedSurveys < ActiveRecord::Migration
  def change
    create_table :resolved_surveys do |t|
      t.date :fecha_resolucion
      t.integer :survey_id

      t.timestamps
    end
  end
end
