class Phrase < ApplicationRecord
  include PublicActivity::Model

  acts_as_votable
  include SharedMethods
  extend FriendlyId
  friendly_id :phrase, use: :slugged
  #self.per_page = 10
  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]

  belongs_to :user
  has_many :examples

  validates :translation, presence: true
  validates :phrase, presence: true
  validates :phrase, uniqueness: true

  validates :category,
            inclusion: {
                in: %w(Actions Time Productivity Apologies),
                message: "%{value} is not a valid categoty"
            }


  enum category: %w(Actions Time Productivity Apologies)


  accepts_nested_attributes_for :examples, allow_destroy: true

  def author?(user)
    self.user == user
  end
end
