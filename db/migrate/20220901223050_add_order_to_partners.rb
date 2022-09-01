class AddOrderToPartners < ActiveRecord::Migration[7.0]
  def change
    add_column :partners, :order, :integer
  end
end
