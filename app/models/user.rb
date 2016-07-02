class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :attachment, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachment, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }
end
