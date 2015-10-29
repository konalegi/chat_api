class API::V1::Chats::ChatSerializer < ActiveModel::Serializer
  attributes :id

  has_many :users
  has_many :messages
end
