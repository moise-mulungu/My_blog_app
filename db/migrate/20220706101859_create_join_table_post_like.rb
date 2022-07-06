class CreateJoinTablePostLike < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :likes do |t|
      # t.index [:post_id, :like_id]
      # t.index [:like_id, :post_id]
    end
  end
end
