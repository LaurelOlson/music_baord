class AddDefaultCountToSongs < ActiveRecord::Migration
  def change
    change_column_default :songs, :count, 0
  end
end
