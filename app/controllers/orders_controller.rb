class OrdersController < ApplicationController
    before_action :set_customer
    before_action :set_customer_order, only: [:show, :update, :destroy]
  
    # GET /customers/:customer_id/orders
    def index
      json_response(@customer.orders)
    end
  
    # GET /customers/:customer_id/orders/:id
    def show
      json_response(@order)
    end
  
    # POST /customers/:customer_id/orders
    def create
      @customer.orders.create!(order_params)
      json_response(@customer, :created)
    end
  
    # PUT /customers/:customer_id/orders/:id
    def update
      @order.update(order_params)
      head :no_content
    end
  
    # DELETE /customers/:customer_id/orders/:id
    def destroy
      @order.destroy
      head :no_content
    end
  
    private
  
    def order_params
      params.permit(:order_no)
    end
  
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
  
    def set_customer_order
      @order = @customer.orders.find_by!(id: params[:id]) if @customer
    end  

end
