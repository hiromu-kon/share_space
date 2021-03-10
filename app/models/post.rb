class Post < ApplicationRecord
  belongs_to :host_user, optional: true
  belongs_to :call_center_user, optional: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 600 }
  validates :reward, presence: true, numericality: true
  validates :recruit_people, presence: true, numericality: true
end
