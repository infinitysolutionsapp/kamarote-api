class AddTargetToPartners < ActiveRecord::Migration[7.0]
  def change
    add_column :partners, :target, :string
  end
end
