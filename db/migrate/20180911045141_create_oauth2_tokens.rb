class CreateOauth2Tokens < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth2_tokens do |t|
      t.string :access_token
      t.string :token_type
      t.string :refresh_token
      t.string :expiry

      t.timestamps
    end
  end
end
