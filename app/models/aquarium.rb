class Aquarium < ApplicationRecord
  self.table_name = 'aquaria'
  has_many :reviews, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "location", "name", "region", "updated_at", "website"]
  end

  def self.ransackable_associations(auth_object = nil)
    []  # 必要に応じて関連付けを追加します
  end
end
