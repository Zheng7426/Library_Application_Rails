class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_secure_password

  has_and_belongs_to_many :books
  has_many :favorite_books
  has_many :favorites, through: :favorite_books, source: :book

  has_many :book_orders
  has_many :selected, through: :book_orders, source: :book

  #ActiveStorage
  has_one_attached :avatar
end
