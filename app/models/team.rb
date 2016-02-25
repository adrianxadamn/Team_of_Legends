class Team < ActiveRecord::Base
  has_many :users
  belongs_to :owner, class_name:  "User",
                     foreign_key: "user_id"
end
