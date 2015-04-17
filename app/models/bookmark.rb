class Bookmark < ActiveRecord::Base
  extend FriendlyId

  friendly_id :stripped_url, use: :slugged
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable

  def stripped_url
    URI.parse(url).host.split('.')[1]
  end


end
