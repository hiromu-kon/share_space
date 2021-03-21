class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, length: { maximum: 200 }, presence: true, uniqueness: true
  has_one_attached :image
  has_one_attached :header_image
  has_many :posts, dependent: :destroy
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end