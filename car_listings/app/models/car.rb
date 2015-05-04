class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :mileage, presence: true, numericality: { only_integer: true }
  validates :year, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1920
  }
end
