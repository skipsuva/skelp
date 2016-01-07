class Review < ActiveRecord::Base
  belongs_to :patron #removed 's'

  belongs_to :bar

  validates :rating, presence: true
  validates :patron_id, presence: true
  validates :bar_id, presence: true

end
