class Message < ApplicationRecord
  belongs_to :message_thread

  validates :content, presence: true

  after_update_commit -> { broadcast_append_to "messages", partial: "messages/message", locals: {message: self} }
end
