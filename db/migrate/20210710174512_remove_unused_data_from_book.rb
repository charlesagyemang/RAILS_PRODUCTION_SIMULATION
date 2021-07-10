class RemoveUnusedDataFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :custom_int
    remove_column :books, :custom_number
    remove_column :books, :custom_data
  end
end
