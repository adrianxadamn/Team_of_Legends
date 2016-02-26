class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: { message: "cannot be blank" }
end
