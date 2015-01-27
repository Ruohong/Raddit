class RemoveVotedFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :voted, :boolean
  end
end
