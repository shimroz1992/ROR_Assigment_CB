# frozen_string_literal: true

FactoryBot.define do
  factory :event_a do
    name { 'Event A' }
    association :user
    # other attributes as needed
  end
end
