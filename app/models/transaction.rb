class Transaction < ActiveRecord::Base
  belongs_to :users

  def productfind(params1)
  	amazonproductfind(params1)

  end

  def amazonproductfind(searchtext)
  	Amazon::Ecs.configure do |options|
	 options[:AWS_access_key_id] = ENV["AWSAccessKeyId"]
	 options[:AWS_secret_key] = ENV["AWSSecretKey"]
	 options[:associate_tag] = ENV["AMAZON_ASSOCIATE_TAG"]
	end

	
	 res = Amazon::Ecs.item_search(searchtext, :response_group => 'Medium', :search_index => 'All')
	#@doc = Nokogiri::XML(open("#{res}"))

	 if res.has_error?
	 	p res.error
	 else
	 	
		res.items.each do |item|
			@asin= item.get("ASIN")
	    # retrieve string value using XML path
	    p "ASIN: #{item.get('ASIN')} Title: #{item.get('ItemAttributes/Title')}  Price: #{item.get('OfferSummary/LowestNewPrice/FormattedPrice')}"
		end
 	 end
  end
end

