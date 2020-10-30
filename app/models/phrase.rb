class Phrase < ApplicationRecord
  include PublicActivity::Model

  acts_as_votable
  include SharedMethods
  extend FriendlyId
  friendly_id :phrase, use: :slugged
  #self.per_page = 10
  #CATEGORIES = [['actions', 0], ['time', 1], ['productivity', 2], ['apologies', 3], ['common', 4]]

  belongs_to :user
  has_many :examples

  validates :translation, presence: true
  validates :phrase, presence: true
  validates :phrase, uniqueness: true

  #validates :category,
  #          inclusion: {
  #              in: %w(actions time productivity apologies common),
  #              message: "%{value} is not a valid categoty"
  #          }

  enum category: [:active, :time, :productivity, :apologies, :common]


  accepts_nested_attributes_for :examples, allow_destroy: true

  def author?(user)
    self.user == user
  end
end
