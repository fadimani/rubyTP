class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :description
      t.references :utilisateur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
