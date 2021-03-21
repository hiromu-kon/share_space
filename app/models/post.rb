class Post < ApplicationRecord
  belongs_to :user
  belongs_to :call_center_user, optional: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 600 }
  validates :reward, presence: true, numericality: true
  validates :recruit_people, presence: true, numericality: true
  has_one_attached :image
end
