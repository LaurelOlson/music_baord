class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :song
      t.integer :rating
      t.string :reviews
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
