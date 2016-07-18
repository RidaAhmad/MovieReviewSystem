class Review < ActiveRecord::Base

  paginates_per 5

  validates :comment, presence: true, length: { maximum: 255 }

  belongs_to :movie
  belongs_to :user

  has_many :reports, dependent: :destroy
end
