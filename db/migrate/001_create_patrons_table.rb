class CreatePatronsTable < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :name
      t.string :email
      t.integer :age
    end
  end
end
