class Session < ActiveRecord::Base
  has_one :user

  validates :token, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
