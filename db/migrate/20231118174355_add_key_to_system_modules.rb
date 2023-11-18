class AddKeyToSystemModules < ActiveRecord::Migration[7.1]
  def change
    add_column :system_modules, :key, :string

    add_index :system_modules, :key, unique: true
  end
end
