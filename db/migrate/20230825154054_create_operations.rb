# frozen_string_literal: true

class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :public_uid, index: { unique: true }, null: false
      t.references :account, null: false, foreign_key: true
      t.string     :sidekiq_job_id
      t.string     :status, null: false, default: "queued"

      t.string :worker_name, null: false
      t.json   :arguments, null: false, default: {}

      t.references :run_after, index: true

      t.datetime :queued_at
      t.datetime :finished_at
      t.string   :error_message

      t.timestamps
    end

    add_index  :operations, :sidekiq_job_id, unique: true
    add_column :accounts, :operations_count, :integer, null: false, default: 0
  end
end
