class User < ActiveRecord::Base
  belongs_to :team
  has_many :posts

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 4..20 }
end
