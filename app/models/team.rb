class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy

  belongs_to :owner, class_name:  "User",
                     foreign_key: "user_id"

  validates :name, presence: true, uniqueness: true, length: {in: 4..15}
  validates :team_abbreviation, presence: true, uniqueness: true, length: {in: 2..3}

end
