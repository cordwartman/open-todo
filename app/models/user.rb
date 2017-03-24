class User < ActiveRecord::Base
  has_many :lists
  validates :name, presence: true

  validates :password, presence: true, length: { minimum: 5 }

end
