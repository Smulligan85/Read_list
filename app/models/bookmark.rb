class Bookmark < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable

  

  friendly_id :url
end
