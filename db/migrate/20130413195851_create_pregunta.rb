class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :preguntas do |t|
      t.string :text
      t.integer :tipo_pregunta_id

      t.timestamps
    end
  end
end
