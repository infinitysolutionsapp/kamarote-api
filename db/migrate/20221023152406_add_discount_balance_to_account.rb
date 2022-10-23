class AddDiscountBalanceToAccount < ActiveRecord::Migration[7.0]
    def change
      add_column :accounts, :discount_balance, :decimal
    end
  end
  