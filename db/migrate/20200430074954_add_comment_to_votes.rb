class AddCommentToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :comment, :text
  end
end
