class Movie < ActiveRecord::Base

  paginates_per 12

  GENRES = ['horror', 'comedy', 'action', 'crime', 'drama', 'thriller', 'fantasy', 'animation']

  validates :title, presence: true, length: { maximum: 150 }
  validates :genre, presence: true, length: { maximum: 30 }, inclusion: { in: GENRES }
  validates :trailer, length: { maximum: 255 }
  validates :release_date, presence: true

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorite_movies, dependent: :destroy
  has_many :favorited_by, through: :favorite_movies, source: :user

  scope :ordered, -> { order(updated_at: :desc) }
  scope :approved, -> { where(approved: true).ordered }
  scope :featured, -> { where(approved: true, featured: true).ordered }
  scope :latest, -> { where(approved: true).order(release_date: :desc) }
  scope :top, -> { eager_load(:ratings).where('movies.approved = true').select('avg(ratings.score)').group('movies.id').order('avg(ratings.score) desc, movies.updated_at desc') }

  def self.retrieve_movies(movie_filter)
    if movie_filter == 'featured'
      self.featured
    elsif movie_filter == 'latest'
      self.latest
    elsif movie_filter == 'top'
      self.top
    else
      self.approved
    end
  end

  def get_average_rating
    ratings.present? ? ratings.average(:score) : 0
  end

  def self.search_movies(parameters)
    search_conditions = {}
    search_conditions[:title] = parameters[:title] unless parameters[:title].nil?
    search_conditions[:genre] = parameters[:genre] unless parameters[:genre].nil?
    search_conditions[:actor_name] = parameters[:actor] unless parameters[:actor].nil?
    search_conditions[:release_date] = parameters[:release_date] unless parameters[:release_date].nil?
    order = 'updated_at desc'
    per_page_movies = 12
    search_with = { approved: true }
    search_order = order
    search_pages = parameters[:page]
    search_per_page = per_page_movies

    self.search(conditions: search_conditions, with: search_with, order: search_order, page: search_pages, per_page: search_per_page)
  end
end
