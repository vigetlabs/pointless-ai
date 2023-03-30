class Persona < ApplicationRecord
  validates :name, presence: true
  validates :prompt, presence: true
end
