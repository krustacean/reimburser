class TransactionsController < ApplicationController	

	def new
		@user= current_user
		@transaction = Transaction.new
		render :new #render new post

		#def amazonproductfind(searchtext)
		  	Amazon::Ecs.configure do |options|
			 options[:AWS_access_key_id] = ENV["AWSAccessKeyId"]
			 options[:AWS_secret_key] = ENV["AWSSecretKey"]
			 options[:associate_tag] = ENV["AMAZON_ASSOCIATE_TAG"]
			end
			 res = Amazon::Ecs.item_search(params[:search], :response_group => 'Medium', :search_index => 'All')
			#@doc = Nokogiri::XML(open("#{res}"))
			if res	
				p "got a response from AMZN"
			end

			 if res.has_error?
			 	p res.error
			 else
			 	@searchresult = Hash.new
				res.items.each do |item|
					@searchresult["asin"] = item.get("ASIN")

					@searchresult["title"] = item.get('ItemAttributes/Title')
					
					@searchresult["price"] = item.get('OfferSummary/LowestNewPrice/FormattedPrice')
			    # retrieve string value using XML path
			    #p "ASIN: #{item.get('ASIN')} Title: #{item.get('ItemAttributes/Title')}  Price: #{item.get('OfferSummary/LowestNewPrice/FormattedPrice')}"
				end
		 	 end

		#end
	end

	def show
		@user= current_user
   	 	@transaction = Transaction.find(params[:id])
	   	if user_signed_in?
			user_signed_in=true
		else
			user_signed_in=false
		end
		p params[:id]
		render :show	
  	end

end
