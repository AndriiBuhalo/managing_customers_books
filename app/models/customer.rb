# frozen_string_literal: true

class Customer < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :books, dependent: :destroy

  enum role: %i[customer admin]
end
