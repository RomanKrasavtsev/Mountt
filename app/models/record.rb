class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item

  default_scope { order :date }
end
