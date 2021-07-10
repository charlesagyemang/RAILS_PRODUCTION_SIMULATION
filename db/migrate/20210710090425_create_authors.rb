class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :country
      t.date :birth

      t.timestamps
    end
  end
end
