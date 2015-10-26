class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user

  validates :text, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :chat_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :unread, -> { where read: false }
  scope :recent, -> { order(:created_at) }
end
