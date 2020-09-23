require 'rails_helper'

RSpec.describe 'Products API' do
  # Initialize the test data
  let!(:customer) { create(:customer) }
  let!(:prudocts) { create_list(:product, 20, custumer_id: customer.id) }
  let(:customer_id) { customer.id }
  let(:id) { products.first.id }

  # Test suite for GET /customers/:customers_id/procucts
  describe 'GET /customers/:customer_id/procucts' do
    before { get "/customers/#{customer_id}/procucts" }

    context 'when customer exists' do 
    end

    context 'when customer does not exist' do
      let(:customer_id) { 0 }


    end
  end

  # Test suite for GET /customers/:customer_id/procucts/:id
  describe 'GET /customers/:customer_id/procucts/:id' do
    before { get "/customers/#{customer_id}/procucts/#{id}" }

    context 'when customer procuct exists' do

    end

    context 'when customer procuct does not exist' do
      let(:id) { 0 }


    end
  end

  # Test suite for PUT /customers/:customer_id/procucts
  describe 'POST /customers/:customer_id/procucts' do
    let(:valid_attributes) { { title: 'T-Shirt', price: 35, quantity: 100} }

    context 'when request attributes are valid' do
      before { post "/customers/#{customer_id}/procucts", params: valid_attributes }

    end

    context 'when an invalid request' do
      before { post "/customers/#{customer_id}/procucts", params: { } }


    end
  end

  # Test suite for PUT /customers/:customer_id/procucts/:id
  describe 'PUT /customers/:customer_id/procucts/:id' do
    let(:valid_attributes) { { title: 'T-Shirt' } }

    before { put "/customers/#{customer_id}/procucts/#{id}", params: valid_attributes }

    context 'when procuct exists' do

    end

    context 'when the procuct does not exist' do
      let(:id) { 0 }


     
    end
  end

  # Test suite for DELETE /customers/:id
  describe 'DELETE /customers/:id' do
    before { delete "/customers/#{customer_id}/procucts/#{id}" }

  
  end
end