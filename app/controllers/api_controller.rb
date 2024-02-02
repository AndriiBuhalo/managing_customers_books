class ApiController < ApplicationController
  before_action :authenticate_customer!

  def current_ability
    @current_ability ||= ::Ability.new(current_customer)
  end

  rescue_from  CanCan::AccessDenied do |exception|
    render json: { waring: exception , status: 'authentication_failed' }
  end
end
