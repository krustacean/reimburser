class TransactionsController < ApplicationController
  include AmazonHelper
  def new
    @user= current_user
    @transaction = Transaction.new
    render :new #render new post
  end

  def edit
  end

  def search
    amazon_list = search_amazon_for_list params[:search]
    render :json => amazon_list
  end

  # def show
  #   @user = current_user
  #   @transaction = Transaction.find(params[:id])
  #   if user_signed_in?
  #     user_signed_in=true
  #   else
  #     user_signed_in=false
  #   end
  #   p params[:id]
  #   render :show
  # end

end
