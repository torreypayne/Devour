class PostSub < ActiveRecord::Base
  belongs_to :sub
  belongs_to :post
end
