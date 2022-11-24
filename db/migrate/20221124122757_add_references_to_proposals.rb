class AddReferencesToProposals < ActiveRecord::Migration[7.0]
  def change
    add_reference :proposals, :call, null: true, foreign_key: true
  end
end
