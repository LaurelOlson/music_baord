class RemoveVotesIdAndAddSongIdToVotesTable < ActiveRecord::Migration
  def change
    remove_reference :votes, :votes
    add_reference :votes, :song
  end
end
