class User < ApplicationRecord

  extend FriendlyId
  friendly_id :username, use: :slugged
  include PublicActivity::Model
  tracked
  include SharedMethods
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  has_many :phrases
  has_many :examples
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :username, presence: true
  validates :username, uniqueness: true
  def has_new_notifications?
      PublicActivity::Activity.where(recipient_id: self.id, readed: false).any?
    end
end
