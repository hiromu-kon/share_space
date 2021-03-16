class Message < ApplicationRecord
  belongs_to :host_user
  belongs_to :room

  validates :message, presence: true
end
