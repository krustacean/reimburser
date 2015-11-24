class Transaction < ActiveRecord::Base
  include AmazonHelper
  belongs_to :users

  def update_price
    new_price = search_item_price self.asin
    self.current_price = new_price
    self.save
  end

  def format_price
    "$#{self.current_price / 100}"
  end

  def self.update_all
    Transaction.find_each do |t|
      t.update_price
    end
  end

  def current_savings
     "$#{(self.purchase_price - (self.current_price / 100))}"
  end

end
