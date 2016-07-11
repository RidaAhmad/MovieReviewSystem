class Movie < ActiveRecord::Base

  paginates_per 8

  GENRES = ['horror', 'comedy', 'action', 'crime', 'drama', 'thriller', 'fantasy', 'animation']

  validates :title, presence: true, length: { maximum: 150 }
  validates :genre, presence: true, length: { maximum: 30 }, inclusion: { in: GENRES }

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances

  scope :approved, -> { where(approved: true) }
  scope :featured, -> { where(approved: true, featured: true) }
  scope :latest, -> { where(approved: true).order(release_date: :desc) }

  def self.retrieve_movies(movie_filter)
    if movie_filter == 'featured'
      self.featured
    elsif movie_filter == 'latest'
      self.latest
    else
      self.approved
    end
  end

end
