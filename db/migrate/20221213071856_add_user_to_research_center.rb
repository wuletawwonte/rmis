class AddUserToResearchCenter < ActiveRecord::Migration[7.0]
  def change
    add_reference :research_centers, :user, null: false, default: 14,foreign_key: true
  end
end
