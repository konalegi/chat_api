class API::V1::Chats::MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id

  belongs_to :chat
  belongs_to :user
end
