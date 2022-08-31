class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.float :discount
      t.text :description

      t.timestamps
    end
  end
end
