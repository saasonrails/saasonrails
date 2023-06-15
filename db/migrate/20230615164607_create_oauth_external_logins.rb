class CreateOauthExternalLogins < ActiveRecord::Migration[7.0]
  def change
    create_table :oauth_external_logins do |t|
      t.references :user, foreign_key: true, null: false

      t.string :provider, null: false
      t.string :uid, null: false
      t.string :access_token
      t.string :access_token_secret

      t.datetime :expires_at

      t.timestamps
    end

    add_index :oauth_external_logins, %i[provider uid]
  end
end
