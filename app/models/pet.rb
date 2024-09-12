class Pet < ApplicationRecord
  belongs_to :user

  has_many :posts, as: :reportable

  mount_uploader :photo, PhotoUploader
end
