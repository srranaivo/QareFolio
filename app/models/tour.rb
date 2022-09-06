class Tour < ApplicationRecord
  belongs_to :user
  has_many :consultations

  def is_finished?
    consultations.all? { |c| c.validated}
  end

  def pending_consultations
    consultations.where(validated: false).count
  end

  def next
    # Tour.find(self.date ['id > ?', self.id], order: 'date ASC')
    # trouver mon current tour
    # @currentTour = current_tour.id
    # à partir de mon current tour je dois afficher mon next tour
    next_day = date+1.day
    Tour.where(user: user, date: next_day...).order(date: 'ASC').first
  end


  def previous
    Tour.where(user: user, date: ...date).order(date: 'DESC').first
  end

end
