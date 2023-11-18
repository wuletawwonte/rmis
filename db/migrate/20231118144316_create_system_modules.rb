class CreateSystemModules < ActiveRecord::Migration[7.1]
  def change
    create_table :system_modules do |t|
      t.string :name
      t.text :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
