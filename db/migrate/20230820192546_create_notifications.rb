# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :public_uid, index: { unique: true }, null: false
      t.references :account, null: false, foreign_key: true

      t.string :message, null: false
      t.string :error_message
      t.string :status, null: false, default: "notice"
      t.string :icon_class, null: false, default: "fas fa-info-circle"

      t.timestamps
    end

    add_column :accounts, :notifications_count, :integer, null: false, default: 0
  end
end
