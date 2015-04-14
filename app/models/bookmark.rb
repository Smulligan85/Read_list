class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable
end
