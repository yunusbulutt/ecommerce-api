class CartsController < ApplicationController
    before_action :set_customer
    before_action :set_customer_cart, only: [:show, :update, :destroy]
  
    # GET /customers/:customer_id/carts
    def index
      json_response(@customer.carts)
    end
  
    # GET /customers/:customer_id/carts/:id
    def show
      json_response(@cart)
    end
  
    # POST /customers/:customer_id/carts
    def create
      @customer.carts.create!(cart_params)
      json_response(@customer, :created)
    end
  
    # PUT /customers/:customer_id/carts/:id
    def update
      @cart.update(cart_params)
      head :no_content
    end
  
    # DELETE /customers/:customer_id/carts/:id
    def destroy
      @cart.destroy
      head :no_content
    end
  
    private
  
    def cart_params
      params.permit(:customer_id, :product_id)
    end
  
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
  
    def set_customer_cart
      @cart = @customer.carts.find_by!(id: params[:id]) if @customer
    end
end
