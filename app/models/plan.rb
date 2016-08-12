class Plan < ApplicationRecord
  belongs_to :family
  has_many :item
end
