class AddWebsiteToAquaria < ActiveRecord::Migration[7.0]
  def change
    add_column :aquaria, :website, :string
  end
end
