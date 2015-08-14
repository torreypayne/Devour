json.extract! @sub, :title, :description, :moderator_id
json.posts(@sub.posts)
