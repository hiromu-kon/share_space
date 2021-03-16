class Entry < ApplicationRecord
  belongs_to :host_user
  belongs_to :room

  validates :room_id, uniqueness: { scope: :host_user_id }
end
