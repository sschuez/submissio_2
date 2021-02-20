class AddDescriptionToSections < ActiveRecord::Migration[6.1]
  def change
  	add_column :sections, :description, :text, :default => ""
  end
end
