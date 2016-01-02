class Review < ActiveRecord::Base
  belongs_to :patrons

  validates :rating, presence: true
  validates :patron_id, presence: true
  validates :bar_id, presence: true

end
