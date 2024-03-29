# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :title
      t.string :description
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
