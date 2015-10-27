class User < ActiveRecord::Base
  has_many :messages
  has_and_belongs_to_many :chats

  validates :name, presence: true
  validates :email, presence: true
end
