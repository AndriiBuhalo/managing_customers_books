# frozen_string_literal: true

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  it 'is valid with valid attributes' do
    expect(book).to be_valid
  end

  it 'is not valid without a name' do
    book.name = nil
    expect(book).not_to be_valid
  end
end
