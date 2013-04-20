class CreateResolvedSurveys < ActiveRecord::Migration
  def change
    create_table :resolved_surveys do |t|
      t.date :fecha_resolucion
      t.integer :question_id

      t.timestamps
    end
  end
end
