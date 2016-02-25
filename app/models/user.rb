class User < ActiveRecord::Base
  belongs_to :team
  has_many :posts

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 4..20 }
  validates :name, presence: true, uniqueness: true, length: {in: 4..15}
  validates :ign, presence: true, uniqueness: true, length: {in: 4..15}
  validates :email, presence: true, uniqueness: true, length: {in: 4..30}
end
