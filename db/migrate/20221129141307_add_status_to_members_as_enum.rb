class AddStatusToMembersAsEnum < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :status, :integer, default: 0
  end
end
