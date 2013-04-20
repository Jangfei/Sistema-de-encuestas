class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :nombre
      t.integer :user_id

      t.timestamps
    end
  end
end
