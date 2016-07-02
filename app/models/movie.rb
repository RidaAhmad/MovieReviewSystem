class Movie < ActiveRecord::Base

  GENRES = ['horror', 'comedy', 'action', 'crime', 'drama', 'thriller', 'fantasy', 'animation']

  validates :title, presence: true, length: { maximum: 150 }
  validates :genre, presence: true, length: { maximum: 30 }, inclusion: { in: GENRES }

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances
end
