class Book < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :comments, dependent: :destroy
end
