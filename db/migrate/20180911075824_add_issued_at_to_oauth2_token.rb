class AddIssuedAtToOauth2Token < ActiveRecord::Migration[5.2]
  def change
    add_column :oauth2_tokens, :issued_at, :datetime
  end
end
