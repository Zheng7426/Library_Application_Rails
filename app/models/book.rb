class Book < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :comments, dependent: :destroy
  has_many :favorite_books
  has_many :favorited_by, through: :favorite_books, source: :user
end
