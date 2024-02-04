# frozen_string_literal: true

class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :role, :created_at

  attribute :created_date do |customer|
    customer&.created_at&.strftime('%d/%m/%Y')
  end
end
