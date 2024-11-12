class AddCountryToTracking < ActiveRecord::Migration[7.2]
  def up
    add_column :tracking_requests, :country, :string unless column_exists? :tracking_requests, :country
  end

  def down
    remove_column :tracking_requests, :country if column_exists? :tracking_requests, :country
  end
end
