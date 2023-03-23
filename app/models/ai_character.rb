class AiCharacter < ApplicationRecord
  validates :name, presence: true
  validates :prompt, presence: true
end
