json.extract! @post, :id, :title, :url, :content, :user_id, :created_at, :updated_at
json.comments(@post.comments)
