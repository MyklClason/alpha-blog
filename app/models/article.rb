class Article < ActiveRecord::Base
  validates :title, presence: true, lenth: {minimum: 3, maximum: 50}
  validates :description, presence: true, lenth: {minimum: 10, maximum: 300}
end