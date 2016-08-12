class User < ApplicationRecord
  has_one :family
  has_many :record
end
