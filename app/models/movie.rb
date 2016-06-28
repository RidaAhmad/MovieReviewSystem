class Movie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 150 }
end
