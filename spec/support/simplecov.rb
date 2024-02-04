# frozen_string_literal: true

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter %w[spec app/serializer app/channels app/jobs app/mailers app/controllers/customers
                  app/controllers/concerns]
  end
end
