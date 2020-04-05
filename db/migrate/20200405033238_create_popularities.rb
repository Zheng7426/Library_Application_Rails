class CreatePopularities < ActiveRecord::Migration[6.0]
  def change
    create_table :popularities do |t|
      t.string :isbn
      t.integer :future_ranking

      t.timestamps
    end
  end
end
