class Track < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :title, presence: true
  #validates :audio, presence: true

  attr_accessible :title, :release_date, :audio

  mount_uploader :audio, AudioUploader
end
