class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.decimal :balance
      t.references :user, null: false, foreign_key: true
      t.string :agency
      t.string :account

      t.timestamps
    end
  end
end
