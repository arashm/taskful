# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy

  def lat_long
    @lat_long ||= Geocoder.search("#{country}, #{city}").first&.coordinates
  end
end
