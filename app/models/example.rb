class Example < ApplicationRecord
  include PublicActivity::Model
  # tracked
  include SharedMethods
  belongs_to :user
  belongs_to :phrase
  acts_as_votable
  validates :example, presence: true
end
