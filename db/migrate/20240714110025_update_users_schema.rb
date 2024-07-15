class UpdateUsersSchema < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :provider)
      add_column :users, :provider, :string
    end

    unless column_exists?(:users, :uid)
      add_column :users, :uid, :string
    end

    unless column_exists?(:users, :username)
      add_column :users, :username, :string
    end

    unless column_exists?(:users, :name)
      add_column :users, :name, :string
    end

    unless column_exists?(:users, :oauth_token)
      add_column :users, :oauth_token, :string
    end

    unless column_exists?(:users, :oauth_expires_at)
      add_column :users, :oauth_expires_at, :datetime
    end

    unless column_exists?(:users, :image)
      add_column :users, :image, :string
    end
  end
end
