class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item

  default_scope { order :date }

  validates :date, :description, :value, presence: true
  validates :value, numericality: true
end
