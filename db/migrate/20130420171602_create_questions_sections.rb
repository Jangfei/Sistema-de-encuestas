class CreateQuestionsSections < ActiveRecord::Migration
  def change
    create_table :questions_sections, :id => false do |t|
      t.integer :question_id
      t.integer :section_id

    end
    add_index(:questions_sections, [:question_id, :section_id], :unique => true)
  end

end
