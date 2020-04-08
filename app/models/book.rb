class Book < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :comments, dependent: :destroy

  #User part: adding favorite books into the bookmark
  has_many :favorite_books
  has_many :favorited_by, through: :favorite_books, source: :user

  #Employee part: adding books into procurement list
  has_many :book_orders
  has_many :selected_by, through: :book_orders, source: :user

  # one-to-one
  has_one :popularity, foreign_key: :isbn, class_name: "Popularity"

  # Bi-directional looped associations
  # https://stackoverflow.com/questions/2168442/many-to-many-relationship-with-the-same-model-in-rails
  has_many :book2_similarity_matrics, foreign_key: :isbn2, class_name: "SimilarityMatrix"
  has_many :book2s, through: :book2_similarity_matrics, source: :book2

  has_many :book1_similarity_matrics, foreign_key: :isbn1, class_name: "SimilarityMatrix"
  has_many :book1s, through: :book1_similarity_matrics, source: :book1
end
