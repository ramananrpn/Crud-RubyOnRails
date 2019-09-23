class Post < ActiveRecord::Base
  attr_accessible :content, :topic, :user_id
end
