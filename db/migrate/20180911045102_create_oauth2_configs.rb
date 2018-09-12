class CreateOauth2Configs < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth2_configs do |t|
      t.string :ClientID
      t.string :ClientSecret
      t.string :EndpointAuthURL
      t.string :EndpointTokenURL
      t.string :RedirectURL
      t.string :Scopes

      t.timestamps
    end
  end
end
