class CreateBarsTable < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.string :theme
    end
  end
end
