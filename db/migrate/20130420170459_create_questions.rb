class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :descripcion
      t.integer :question_type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
