class CreateConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :configs do |t|
      t.string :banner_url
      t.string :main_title
      t.string :second_title

      t.timestamps
    end
  end
end
