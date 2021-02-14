class Message < ApplicationRecord
  belongs_to :room
  belongs_to :account
  validates :context, presence: true, length: { maximum: 255 }
end
