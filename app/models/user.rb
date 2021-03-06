class User < ApplicationRecord
  has_many :itineraries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :searches, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
