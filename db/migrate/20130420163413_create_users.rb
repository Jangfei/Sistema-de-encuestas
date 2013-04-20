class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nac
      t.string :user_name
      t.string :password
      t.string :ciudad
      t.integer :profile_id

      t.timestamps
    end
  end
end
