class MessageThread < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :user_id, presence: true

  def to_s
    "#{user.email}-#{created_at.strftime("%Y%m%d%H%M%S")}"
  end
end
