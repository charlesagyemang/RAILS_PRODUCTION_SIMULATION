class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :pages
      t.date :published_date
      t.string :topic
      t.string :isbn
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
