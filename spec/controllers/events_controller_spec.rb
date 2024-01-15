# frozen_string_literal: true

# spec/controllers/events_controller_spec.rb

require 'rails_helper'
require 'webmock/rspec'
# rubocop:disable Metrics/BlockLength
RSpec.describe EventsController, type: :controller do
  describe '#send_notification' do
    it 'sends notification successfully' do
      # Create a WebMock stub for the external API request
      stub_request(:post, 'https://api.iterable.com/api/email/target').to_return(
        body: { msg: 'Notification sent successfully!', code: 'Success', params: {} }.to_json, headers: {}
      )

      # Assuming you have a factory for creating users
      user = create(:user)

      # Stub authentication methods
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)

      # Your code that makes the request
      post :create_event_b

      # Assertions or other test logic here
      expect(flash[:notice]).to eq('Notification sent successfully!')
      expect(flash[:alert]).to be_nil
    end
    it 'handles error sending notification' do
      user = create(:user) # Assuming you have a factory for creating users
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)

      stub_request(:post, 'https://api.iterable.com/api/email/target')
        .to_return(
          body: { msg: 'Internal Server Error', code: 'GenericError', params: {} }.to_json,
          headers: { 'Content-Type' => 'text/plain' }
        )

      post :create_event_b
      expect(flash[:notice]).to be_nil
      expect(flash[:alert]).to eq('Error sending notification: Internal Server Error')
    end

    it 'handles unexpected error' do
      user = create(:user) # Assuming you have a factory for creating users
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)

      stub_request(:post, 'https://api.iterable.com/api/email/target')
        .to_raise(StandardError.new('Unexpected error'))

      post :create_event_b

      expect(flash[:notice]).to be_nil
      expect(flash[:alert]).to eq('An unexpected error occurred: Unexpected error')
    end
  end
  # rubocop:enable Metrics/BlockLength
end
