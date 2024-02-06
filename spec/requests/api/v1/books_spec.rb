# frozen_string_literal: true

RSpec.describe 'Api::V1::Books' do
  describe 'POST /api/v1/books' do
    let(:customer) { create(:customer) }
    let(:customer_token) { Devise::JWT::TestHelpers.auth_headers({}, customer)['Authorization'] }

    it 'creates a book when authenticated' do
      headers = { 'Authorization' => customer_token, 'Content-Type' => 'application/json' }
      book_params = { name: 'Sample Book', title: 'Sample Title', description: 'Sample Description' }

      post('/api/v1/books', params: book_params.to_json, headers:)
      expect(response).to have_http_status(:created)
      expect(response.parsed_body['name']).to eq('Sample Book')
    end

    it 'returns errors when the book creation fails' do
      headers = { 'Authorization' => customer_token, 'Content-Type' => 'application/json' }
      invalid_book_params = { book: { name: '', title: '', description: '' } }

      post('/api/v1/books', params: invalid_book_params.to_json, headers:)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.parsed_body['errors']).to be_present
    end
  end

  describe 'DELETE /api/v1/books/:id' do
    let(:admin) { create(:customer, role: 'admin') }
    let(:admin_token) { Devise::JWT::TestHelpers.auth_headers({}, admin)['Authorization'] }
    let(:book) { create(:book, customer: admin) }

    it 'deletes a book when authenticated role admin' do
      headers = { 'Authorization' => admin_token, 'Content-Type' => 'application/json' }

      delete("/api/v1/books/#{book.id}", headers:)

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['message']).to eq('Book deleted successfully')
    end
  end
end
