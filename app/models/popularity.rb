class Popularity < ApplicationRecord
  belongs_to :book, foreign_key: :isbn, class_name: "Book"
end
