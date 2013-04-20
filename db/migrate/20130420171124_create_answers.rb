class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :descripcion
      t.integer :resolved_survey_id
      t.integer :question_id

      t.timestamps
    end
  end
end
