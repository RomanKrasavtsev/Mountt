class User < ApplicationRecord
  has_one :family
  has_many :record

  default_scope { order :firstname }
end
