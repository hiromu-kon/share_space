class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 600 }
  validates :reward, presence: true, numericality: true, if: :user_skill?
  validates :recruit_people, presence: true, numericality: true, if: :user_skill?
  has_one_attached :image
  validate :image_valid?

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships

  has_many :comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_one :map, dependent: :destroy

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

  def user_skill?
    user.skill == "false"

  end

  def image_valid?
    unless image.attached?
      errors.add(:image)
    end
  end

  def create_notification_comment!(current_user, comment_id)
  # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
  # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
