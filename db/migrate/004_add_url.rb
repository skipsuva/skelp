class AddUrl < ActiveRecord::Migration
  def change
    add_column :bars, :img_url, :string
  end
end
