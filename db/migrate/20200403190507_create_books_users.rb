class CreateBooksUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :books_users, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
    end
  end
end
