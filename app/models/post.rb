class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 600 }
  validates :reward, presence: true, numericality: true
  validates :recruit_people, presence: true, numericality: true
  has_one_attached :image

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def save_tags(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end
end
