class RemoveUsersReferenceAddUserReferenceToVotesTable < ActiveRecord::Migration
  def change
    remove_reference :votes, :users
    add_reference :votes, :user
  end
end
