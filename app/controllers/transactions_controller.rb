class TransactionsController < ApplicationController
	# before_action :authenticate_user!, only: []
	# before_action :check_cart!

  def new
  	gon.client_token = generate_client_token
  	
  end

  def create
  
  	unless current_user.has_payment_info?
  	@result = Braintree::Transaction.sale(amount: current_user.booking_total_price, payment_method_nonce: params[:payment_method_nonce], options:{store_in_vault: true})
    else
      @result = Braintree::Transaction.sale(amount: current_user.booking_total_price, payment_method_nonce: params[:payment_method_nonce])
    end

  	if @result.success?
      current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
  		redirect_to root_url, notice: "Congratulation! Your transction has been successful"
  	else
  		flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
  		gon.client_token = generate_client_token
  		render :new
  	end
  end

  private
  
  def generate_client_token
    if current_user.has_payment_info?
  	Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
    Braintree::ClientToken.generate
    end
  end

  def check_cart!
  # 	if current_user.booking_total_price.empty?
  # 		redirect_to root_url, notice: 'Please add a booking!'
  # 	end
  end

  private
  def transaction_params
    params.require(:transction).permit(:user_id)
  end

end
