class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.references :program, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
