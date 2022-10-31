class RemoveBodyFromCalls < ActiveRecord::Migration[7.0]
  def change
    remove_column :calls, :body, :text
  end
end
