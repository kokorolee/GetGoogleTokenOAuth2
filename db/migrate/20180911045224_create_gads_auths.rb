class CreateGadsAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :gads_auths do |t|
      t.string :CustomerId
      t.string :DeveloperToken
      t.string :UserAgent
      t.string :PartialFailure
      t.string :ValidateOnly

      t.timestamps
    end
  end
end
