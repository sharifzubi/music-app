class User < ActiveRecord::Base
  has_secure_password

#MUST nest tracks inside users
#accept_nested_attributes_for_child

  has_many :tracks
  has_many :comments, through: :tracks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  attr_accessible :name, :image, :role, :email, :password, :password_confirmation, :genre, :about, :css

  mount_uploader :image, ImageUploader

  def role?(r)
    self.role == r.to_s
  end

end
