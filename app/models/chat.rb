class Chat < ActiveRecord::Base
  has_many :messages
  has_and_belongs_to_many :users

  def find_chat_for(sender, recipient)
    Chat.joins(:users).where(users: { id: [sender.id, recipient.id] }).group("id").having("count(users) = ?", 2).first
  end
end
