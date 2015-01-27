class AddVotedToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voted, :boolean
  end
end
