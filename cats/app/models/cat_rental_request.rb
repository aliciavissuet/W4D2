class CatRentalRequest < ApplicationRecord
  STATUSES = ['PENDING', 'APPROVED', 'DENIED']
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES,
    message: "%{status} is not a valid status" }

  
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    requests = CatRentalRequest.find_by(cat_id: self.cat_id)
  end
end
