class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :descripcion
      t.integer :question_id

      t.timestamps
    end
  end
end
