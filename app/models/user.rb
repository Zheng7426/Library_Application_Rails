class User < ApplicationRecord
  # has_secure_password

  has_and_belongs_to_many :books
  has_many :favorite_books
  has_many :favorites, through: :favorite_books, source: :book
end
