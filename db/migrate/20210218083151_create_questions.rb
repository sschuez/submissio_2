class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :data_type, default: "text"
      t.string :content
      t.text :additional_information
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
