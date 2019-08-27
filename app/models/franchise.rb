class Franchise < ApplicationRecord
  has_many :seasons

  accepts_nested_attributes_for :seasons, allow_destroy: true
end
