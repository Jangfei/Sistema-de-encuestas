class ChangeDescriptionInAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :descripcion, :text
  end

 
end
