# frozen_string_literal: true

RSpec.describe Ability do
  let(:user) { create(:customer) }
  let(:admin) { create(:customer, role: 'admin') }

  describe 'guest abilities' do
    subject(:ability) { described_class.new(nil) }

    it 'can read sign up' do
      expect(ability).to be_able_to(:read, :sign_up)
    end

    it 'cannot create books' do
      expect(ability).not_to be_able_to(:create, Book)
    end

    it 'cannot manage any resource' do
      expect(ability).not_to be_able_to(:manage, :all)
    end
  end

  describe 'authenticated user abilities' do
    subject(:ability) { described_class.new(user) }

    it 'can create books' do
      expect(ability).to be_able_to(:create, Book)
    end

    it 'cannot manage any resource' do
      expect(ability).not_to be_able_to(:manage, :all)
    end

    it 'cannot read sign up' do
      expect(ability).not_to be_able_to(:read, :sign_up)
    end
  end

  describe 'admin abilities' do
    subject(:ability) { described_class.new(admin) }

    it 'can manage all resources' do
      expect(ability).to be_able_to(:manage, :all)
    end

    it 'can read sign up' do
      expect(ability).to be_able_to(:read, :sign_up)
    end
  end
end
