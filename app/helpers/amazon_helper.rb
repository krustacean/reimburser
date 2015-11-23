module AmazonHelper

  def search_amazon(search)
    Amazon::Ecs.configure do |options|
      options[:AWS_access_key_id] = ENV["AWSAccessKeyId"]
      options[:AWS_secret_key] = ENV["AWSSecretKey"]
      options[:associate_tag] = ENV["AMAZON_ASSOCIATE_TAG"]
    end
    Amazon::Ecs.item_search(search, :response_group => 'Medium', :search_index => 'All')
  end

  def search_amazon_for_list(search)
    res = search_amazon(search)
    @searchresult = []
    res.items.each do |item|
      search_item = {}
      search_item["asin"] = item.get("ASIN")
      search_item["name"] = item.get('ItemAttributes/Title')
      search_item["current_price"] = item.get('OfferSummary/LowestNewPrice/FormattedPrice')
      search_item["upc"]= item.get('ItemAttributes/UPC')
      search_item["listing_url"]= item.get('DetailPageURL')
      search_item["image_url"]= item.get('MediumImage/URL')
      @searchresult.push search_item
    end
    return @searchresult
  end

  def search_item_price asin
    res = search_amazon asin
    res.items.first.get('OfferSummary/LowestNewPrice/Amount')
  end

end
