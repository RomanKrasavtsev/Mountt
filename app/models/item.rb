class Item < ApplicationRecord
  belongs_to :family
  has_many :record
end
