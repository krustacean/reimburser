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

end
