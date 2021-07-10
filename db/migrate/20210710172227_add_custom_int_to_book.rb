class AddCustomIntToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :custom_int, :decimal
  end
end
