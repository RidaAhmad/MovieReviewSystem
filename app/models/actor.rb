class Actor < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }, inclusion: { in: %w(male female) }

  has_many :appearances, dependent: :destroy
  has_many :movies, through: :appearances

  scope :actor_names, -> { pluck(:name) }
end
