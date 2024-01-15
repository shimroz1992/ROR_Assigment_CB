# frozen_string_literal: true

# app/controllers/events_controller.rb
class EventsController < ApplicationController
  before_action :authenticate_user!
  include HTTParty

  def index
    @events = EventA.all
  end

  def create_event_a
    EventA.create(name: 'Event A', user_id: current_user.id)
    redirect_to root_path
  end

  def create_event_b
    event = EventB.create(name: 'Event B', user_id: current_user.id)
    send_notification(event) if event.persisted?
    redirect_to root_path
  end

  private

  # rubocop:disable Metrics/MethodLength
  def send_notification(_event)
    response = HTTParty.post('https://api.iterable.com/api/email/target', {
                               body: {
                                 api_key: 'YOUR_ITERABLE_API_KEY',
                                 campaign_id: 13_594,
                                 recipient_email: 'user@example.com',
                                 data_fields: {
                                   custom_param: 'paramValue'
                                 },
                                 send_at: '2015-08-31 22:00:00 +00:00'
                               }
                             })
    response_data = JSON.parse(response.body)

    if response_data['code'] == 'Success'
      flash[:notice] = 'Notification sent successfully!'
    else
      flash[:alert] = "Error sending notification: #{response_data['msg']}"
    end
  rescue StandardError => e
    flash[:alert] = "An unexpected error occurred: #{e.message}"
  end
  # rubocop:enable Metrics/MethodLength
end
