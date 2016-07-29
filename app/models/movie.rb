class Movie < ActiveRecord::Base
  SPHINX_PER_PAGE = 12
  PER_TYPE = 4
  DEFAULT_INCLUDE = { include: :attachments }
  DEFAULT_SEARCH_FILTER = { approved: true }
  DEFAULT_SEARCH_ORDER = 'updated_at desc'
  GENRES = ['horror', 'comedy', 'action', 'crime', 'drama', 'thriller', 'fantasy', 'animation']

  paginates_per SPHINX_PER_PAGE

  validates :title, presence: true, length: { maximum: 150 }, format: { with: /[a-zA-Z0-9\s]+/ }
  validates :genre, presence: true, length: { maximum: 30 }, inclusion: { in: GENRES }
  validates :trailer, length: { maximum: 255 }
  validates :release_date, presence: true

  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorite_movies, dependent: :destroy
  has_many :favorited_by, through: :favorite_movies, source: :user
  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  scope :ordered, -> { order(updated_at: :desc) }
  scope :approved, -> { where(approved: true).ordered }
  scope :featured, -> { where(approved: true, featured: true).ordered }
  scope :latest, -> { where(approved: true).order(release_date: :desc) }
  scope :top, -> { joins(:ratings).where(approved: true).group('movies.id').order('avg(ratings.score) desc, movies.updated_at desc') }

  def self.retrieve_movies(movie_filter)
    movies = self.includes(:attachments)
    if movie_filter == 'featured'
      movies.featured
    elsif movie_filter == 'latest'
      movies.latest
    elsif movie_filter == 'top'
      movies.top
    else
      movies.approved
    end
  end

  def get_average_rating
    ratings.present? ? ratings.average(:score) : 0
  end

  def attachments_hash
    if self.attachments.present?
      paths = {}
      {
        attachments: self.attachments.each do |attachment|
          paths[attachment.image_file_name.to_s] = attachment.image.url(:medium)
        end,
        attachments_paths: paths
      }
    else
      {}
    end
  end

  def detailed_hash
    {
      details: self,
      actors: actors,
      reviews: reviews,
      posters: self.attachments_hash,
    }
  end

  def self.retrieve_search_results(params={})
    default_search_options = set_default_search_options(params)
    default_search_options[:conditions][:title] = params[:title] if params[:title].present?
    default_search_options[:conditions][:genre] = params[:genre] if params[:genre].present?
    default_search_options[:conditions][:actor_name] = params[:actor] if params[:actor].present?
    default_search_options[:with][:release_date] = release_date_range(params[:release_date_start], params[:release_date_end]) if params[:release_date_start].present?
    query = params[:query] if params[:query].present?
    self.search(query, default_search_options)
  end

  def self.search_based_on_conditions(params)
    params[:commit].present? ? Movie.retrieve_search_results(params) : Movie.retrieve_movies(params[:filter]).page(params[:page])
  end

  def set_unapproved!
    self.update(approved: false)
  end

  private
    def self.release_date_range(start_date, end_date)
      if start_date.present? && end_date.present?
        validate_date(start_date)..validate_date(end_date)
      elsif start_date.present?
        validate_date(start_date)..Date.today
      end
    end

    def self.validate_date(date)
      begin
        Date.parse(date)
      rescue
        Date.today
      end
    end

    def self.set_default_search_options(params)
      {
        order: DEFAULT_SEARCH_ORDER,
        with: DEFAULT_SEARCH_FILTER,
        conditions: {},
        page: params[:page],
        per_page: SPHINX_PER_PAGE,
        sql: DEFAULT_INCLUDE,
      }
    end
end
