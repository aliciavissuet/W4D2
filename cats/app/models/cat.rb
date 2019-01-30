
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ['black', 'brown', 'white', 'yellow', 'orange']
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F)}
  validates :color, presence: true, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }


  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    time_ago_in_words(self.birth_date)
  end


end
