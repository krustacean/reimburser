class ChangeTransactionsCurrentPriceTargetPricePurchasePriceColumns < ActiveRecord::Migration
  def change
    change_column :transactions, :current_price, :integer
    change_column :transactions, :target_price, :integer
    change_column :transactions, :purchase_price, :integer
  end
end
