class CreateSimilarityMatrices < ActiveRecord::Migration[6.0]
  def change
    create_table :similarity_matrices do |t|
      t.string :isbn1
      t.string :isbn2
      t.decimal :similarity

      t.timestamps
    end
  end
end
