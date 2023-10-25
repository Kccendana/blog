class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  after_save :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
