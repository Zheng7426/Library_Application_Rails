class SimilarityMatrix < ApplicationRecord
  belongs_to :book1, foreign_key: "isbn1", class_name: "Book"
  belongs_to :book2, foreign_key: "isbn2", class_name: "Book"
end
