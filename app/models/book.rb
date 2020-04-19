class Book < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :comments, dependent: :destroy

  #User part: adding favorite books into the bookmark
  has_many :favorite_books
  has_many :favorited_by, through: :favorite_books, source: :user

  #Employee part: adding books into procurement list
  has_many :book_orders
  has_many :selected_by, through: :book_orders, source: :user

  def self.popularity()
    HTTParty.get("https://my.api.mockaroo.com/popularity.json?key=da404bc0")
  end

  def self.similarity_ranking(isbn)
    HTTParty.get("https://my.api.mockaroo.com/similarity_ranking/#{isbn}.json?key=da404bc0")
  end
end
