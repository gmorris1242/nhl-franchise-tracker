class Season < ApplicationRecord
  belongs_to :franchise
  has_one :stat
  has_many :players
  has_many :draftees
  has_many :transactions

  accepts_nested_attributes_for :stat, allow_destroy: true
  accepts_nested_attributes_for :players, allow_destroy: true
  accepts_nested_attributes_for :draftees, allow_destroy: true
  accepts_nested_attributes_for :transactions, allow_destroy: true
end
