class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum:20}
  validates :description, presence: true, length: {minimum: 10}
  validates :author, presence: true, length: {minimum: 3, maximum: 10}
end
