# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Notification do
  let(:valid_attributes) do
    {
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      phone_number: Faker::PhoneNumber.cell_phone_in_e164
    }
  end

  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        notification = described_class.new(valid_attributes)

        expect(notification).to be_valid
      end
    end

    context 'without phone number' do
      it 'is not valid' do
        notification = described_class.new(valid_attributes.except(:phone_number))

        expect(notification).not_to be_valid
      end
    end

    context 'with wrong phone format' do
      it 'is not valid' do
        notification = described_class.new(valid_attributes.merge(phone_number: 'wrong format'))

        expect(notification).not_to be_valid
        expect(notification.errors[:phone_number]).to include('must be in E.164 format')
      end
    end
  end
end
