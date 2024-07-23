class CreateTargetAudiences < ActiveRecord::Migration[7.0]
  def change
    create_table :target_audiences do |t|
      t.string :content

      t.timestamps
    end
  end
end
