class AddCustomNumberToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :custom_number, :integer
  end
end
