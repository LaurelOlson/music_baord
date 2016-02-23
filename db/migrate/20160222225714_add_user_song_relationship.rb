class AddUserSongRelationship < ActiveRecord::Migration
  def change
    add_foreign_key :songs, :user
  end
end
