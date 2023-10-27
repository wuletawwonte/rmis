# frozen_string_literal: true

class RemoveAttachementFromDocuments < ActiveRecord::Migration[7.1]
  def change
    remove_column :documents, :attachement, :string
  end
end
