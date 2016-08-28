class Family < ApplicationRecord
  has_many :user
  has_many :plan
  has_many :item
  has_many :record, through: :user
end
