class Message < ApplicationRecord
  belongs_to :message_thread

  has_one :user, through: :message_thread

  validates :content, presence: true

  after_update_commit -> { broadcast_append_to user, "messages", partial: "messages/assistant_message", locals: {message: self, animate_reply: true} }
end
