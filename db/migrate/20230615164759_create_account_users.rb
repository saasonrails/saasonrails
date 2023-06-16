# frozen_string_literal: true

class CreateAccountUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :account_users do |t|
      t.string :public_uid, index: { unique: true }

      t.references :user,    null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.string :role, null: false, default: "owner"

      t.timestamps
    end

    add_reference :users, :personal_account, foreign_key: { to_table: :accounts }, null: true
  end
end
