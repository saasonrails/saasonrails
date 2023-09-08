# frozen_string_literal: true

class RenameArgumentsToPayloadOnOperations < ActiveRecord::Migration[7.0]
  def change
    rename_column :operations, :arguments, :payload
  end
end
