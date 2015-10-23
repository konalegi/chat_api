class User < ActiveRecord::Base
  has_many :messages
  has_many :chats, through: :messages

  validates :name, presence: true
  validates :email, presence: true
end
