class Room < ApplicationRecord
  has_many :entries
  has_many :host_users, through: :entries
end
