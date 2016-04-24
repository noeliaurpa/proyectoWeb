class User < ActiveRecord::Base
  has_many :session, dependent: :destroy
  has_many :product, dependent: :destroy
  before_save { self.username = username.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :username, presence: true, length: { maximum: 50 },
  uniqueness: { case_sensitive: false }

  has_secure_password
  # validates :password, length: { minimum: 3 }

end
