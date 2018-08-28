class Tweet < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :message, presence: true
  validates :owner, presence: true

  scope :chronological, -> { order(created_at: :desc) }
  scope :with_owner, -> { includes(:owner) }
end
