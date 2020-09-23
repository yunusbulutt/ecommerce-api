require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
  # initialize test data
  let!(:customers) { create_list(:customer, 10) }
  let(:customer_id) { customers.first.id }

  # Test suite for GET /customers
  describe 'GET /customers' do
    # make HTTP get request before each example
    before { get '/customers' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /customers/:id
  describe 'GET /customers/:id' do
    before { get "/customers/#{customer_id}" }

    context 'when the record exists' do

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:customer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  # Test suite for POST /customers
  describe 'POST /customers' do
    # valid payload
    let(:valid_attributes) { { name: 'Yunus', surname: 'Bulut', email: 'bulutt1404@gmail.com', phone: '+90 555 217 01 68' } }

    context 'when the request is valid' do
      before { post '/customers', params: valid_attributes }

    end

    context 'when the request is invalid' do
      before { post '/customers', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

     
    end
  end

  # Test suite for PUT /customers/:id
  describe 'PUT /customers/:id' do
    let(:valid_attributes) { { name: 'Yunus', surname: 'Bulut', email: 'bulutt1404@gmail.com', phone: '+90 555 217 01 68' } }

    context 'when the record exists' do
      before { put "/customers/#{customer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /customers/:id
  describe 'DELETE /customers/:id' do
    before { delete "/customers/#{customer_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end