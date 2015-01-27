class AddIndexToVotes < ActiveRecord::Migration
  def change
  	  add_index :votes, [:post_id, :user_id], :unique => true
  end
end
