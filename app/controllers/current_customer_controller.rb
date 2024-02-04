# frozen_string_literal: true

class CurrentCustomerController < ApplicationController
  before_action :authenticate_customer!

  def index
    render json: CustomerSerializer.new(current_customer).serializable_hash[:data][:attributes], status: :ok
  end
end
