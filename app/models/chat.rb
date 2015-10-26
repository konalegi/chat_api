class Chat < ActiveRecord::Base
  has_many :messages
  has_many :users, through: :messages

  def find_chat_for(sender, receiver)
    joins(:users).where(users: { id: [sender.id, receiver.id] }).having(users_count: 2)
  end
end
