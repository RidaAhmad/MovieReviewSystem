class Actor < ActiveRecord::Base
  GENDERS = %w(male female)

  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }, inclusion: { in: GENDERS }

  has_many :appearances, dependent: :destroy
  has_many :movies, through: :appearances
  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  scope :actor_names, -> { pluck(:name) }
end
