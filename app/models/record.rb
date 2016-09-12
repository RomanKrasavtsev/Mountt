class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :date, :description, :value, presence: true
  validates :value, numericality: true

  scope :current_month, -> { where("date >= ? AND date <= ?", Date.today.at_beginning_of_month, Date.today.end_of_month) }
end
