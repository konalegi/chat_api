class User < ActiveRecord::Base
  has_many :messages
  has_many :chats

  validates :name, presence: true
  validates :email, presence: true
end
