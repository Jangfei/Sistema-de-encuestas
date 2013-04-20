class CreateQuestionSections < ActiveRecord::Migration
  def change
    create_table :question_sections do |t|
      t.integer :question_id
      t.integer :section_id

      t.timestamps
    end
  end

end
