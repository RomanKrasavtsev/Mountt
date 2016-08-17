class Item < ApplicationRecord
  belongs_to :family
  has_many :record

  default_scope { order :name }

  validates :name, presence: true
end
