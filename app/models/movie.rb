class Movie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 150 }

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: :true

  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances
end
