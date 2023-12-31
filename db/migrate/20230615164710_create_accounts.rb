# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :public_uid, index: { unique: true }

      t.string     :name, null: false
      t.boolean    :personal_account, default: false
      t.integer    :projects_count, default: 0, null: false

      t.timestamps
    end
  end
end
