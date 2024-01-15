# frozen_string_literal: true

# db/migrate/20240111064618_create_event_as.rb
class CreateEventAs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_as do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
