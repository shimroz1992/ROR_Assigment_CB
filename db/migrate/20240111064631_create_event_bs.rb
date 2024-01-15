# frozen_string_literal: true

# db/migrate/20240111064631_create_event_bs.rb
class CreateEventBs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_bs do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
