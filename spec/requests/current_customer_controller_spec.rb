# frozen_string_literal: true

RSpec.describe CurrentCustomerController do
  describe 'GET /current_customer' do
    context 'when authenticated' do
      let(:customer) { create(:customer) }
      let(:customer_token) { Devise::JWT::TestHelpers.auth_headers({}, customer)['Authorization'] }
      let(:headers) { { 'Authorization' => customer_token, 'Content-Type' => 'application/json' } }

      before { get '/current_customer', headers: }

      it 'returns current customer details' do
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body['email']).to eq(customer.email)
        expect(response.parsed_body['role']).to eq(customer.role)
      end
    end

    context 'when not authenticated' do
      it 'returns unauthorized' do
        get '/current_customer'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
