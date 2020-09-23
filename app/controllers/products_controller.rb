class ProductsController < ApplicationController
    before_action :set_customer
    before_action :set_customer_product, only: [:show, :update, :destroy]
  
    # GET /customers/:customer_id/products
    def index
      json_response(@customer.products)
    end
  
    # GET /customers/:customer_id/products/:id
    def show
      json_response(@product)
    end
  
    # POST /customers/:customer_id/products
    def create
      @customer.products.create!(product_params)
      json_response(@customer, :created)
    end
  
    # PUT /customers/:customer_id/products/:id
    def update
      @product.update(product_params)
      head :no_content
    end
  
    # DELETE /customers/:customer_id/products/:id
    def destroy
      @product.destroy
      head :no_content
    end
  
    private
  
    def product_params
      params.permit(:title, :price, :quantity)
    end
  
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
  
    def set_customer_product
      @product = @customer.products.find_by!(id: params[:id]) if @customer
    end
end
