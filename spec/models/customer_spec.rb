# frozen_string_literal: true

RSpec.describe Customer, type: :model do
  it 'has many books' do
    customer = FactoryBot.create(:customer)
    book1 = create(:book, customer:)
    book2 = create(:book, customer:)

    expect(customer.books).to include(book1, book2)
  end
end
