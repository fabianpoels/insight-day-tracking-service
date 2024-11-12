class CreateTrackingRequests < ActiveRecord::Migration[7.2]
  def up
    unless table_exists? :tracking_requests
      create_table :tracking_requests do |t|
        t.string :uuid, index: true
        t.datetime :tracked_at
        t.string :ip
        t.string :location
        t.string :os
        t.string :device
        t.string :url
        t.string :referrer
        t.string :language

        t.timestamps
      end
    end
  end

  def down
    drop_table :tracking_requests if table_exists? :tracking_requests
  end
end
