class AddCustomToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :custom, :json, default: {"a" => ""}
  end
end
