class CreateTipoPregunta < ActiveRecord::Migration
  def change
    create_table :tipo_pregunta do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
