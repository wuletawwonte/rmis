class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.date :deadline
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
