class MessageThread < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :user_id, presence: true

  def name
    "#{user.email}-#{created_at.strftime("%Y%m%d%H%M%S")}"
  end

  def generate_assistant_reply
  end

  def historical_message_contents
    hisotircal_messages = messages.where.not(assistant_reply: nil).order(created_at: :desc).pluck(:content, :assistant_reply)
    hisotircal_messages.map do |content, assistant_reply|
      [
        {role: "user", content: content},
        {role: "assistant", content: assistant_reply}
      ]
    end.flatten.compact
  end

  def at_limit?
    messages.count >= 3
  end
end
