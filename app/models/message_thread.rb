class MessageThread < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :user_id, presence: true

  def name
    "#{user.email}-#{created_at.strftime("%Y%m%d%H%M%S")}"
  end

  def generate_assistant_reply
    historical_message_contents = messages.order(created_at: :desc).pluck(:content)  # ["", ""]


    PointyBearClient.submit_prompt
  end
end
