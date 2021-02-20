class AddIdnameToQuestions < ActiveRecord::Migration[6.1]
  def change
  	add_column :questions, :id_name, :string, null: false
  end
end
