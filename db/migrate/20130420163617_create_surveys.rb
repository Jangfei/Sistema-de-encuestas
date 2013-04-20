class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :nombre_encuesta
      t.date :fecha_creacion
      t.integer :user_id

      t.timestamps
    end
  end
end
