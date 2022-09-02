class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours

  def todays_tour
    tours.find_by(date: Date.today)
  end

  def yesterdays_tour
    tours.find_by(date: 1.day.ago).present? ? tours.find_by(date: 1.day.ago) : nil
  end
end
