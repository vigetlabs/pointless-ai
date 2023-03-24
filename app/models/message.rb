class Message < ApplicationRecord
  belongs_to :message_thread

  validates :content, presence: true
end
