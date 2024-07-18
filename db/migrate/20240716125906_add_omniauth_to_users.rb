class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string unless column_exists?(:users, :provider)
    add_column :users, :uid, :string unless column_exists?(:users, :uid)
    add_column :users, :username, :string unless column_exists?(:users, :username)
    add_column :users, :name, :string unless column_exists?(:users, :name)
    add_column :users, :oauth_token, :string unless column_exists?(:users, :oauth_token)
    add_column :users, :oauth_expires_at, :datetime unless column_exists?(:users, :oauth_expires_at)
    add_column :users, :image, :string unless column_exists?(:users, :image)
  end
end
