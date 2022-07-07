class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def posts_count_updated
    users.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
