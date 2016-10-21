class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :origin 
      t.string :destination
      t.string :distance
      t.string :time
      t.string :comments
      t.string :user_id

      t.timestamps
  end
end
