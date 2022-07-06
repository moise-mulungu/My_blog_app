class CreateJoinTableUserLike < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :likes do |t|
      # t.index [:user_id, :like_id]
      # t.index [:like_id, :user_id]
    end
  end
end
