class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :attachement

      t.timestamps
    end
  end
end
