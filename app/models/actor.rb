class Actor < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }, inclusion: { in: %w(male female) }
end
