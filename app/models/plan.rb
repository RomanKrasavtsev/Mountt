class Plan < ApplicationRecord
  belongs_to :family
  belongs_to :item
end
