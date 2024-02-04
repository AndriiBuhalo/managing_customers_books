# frozen_string_literal: true

class AddRoleToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :role, :integer, default: 0
  end
end
