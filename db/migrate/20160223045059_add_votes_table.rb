class AddVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :users
      t.references :votes
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
