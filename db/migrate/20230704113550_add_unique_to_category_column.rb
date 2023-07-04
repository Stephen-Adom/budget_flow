class AddUniqueToCategoryColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :name, :string, unique: true
    add_index :categories, :name
  end
end
