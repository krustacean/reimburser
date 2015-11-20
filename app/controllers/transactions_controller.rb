class TransactionsController < ApplicationController	

	def new
		@user= current_user
		@transaction = Transaction.new
		render :new #render new post
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
