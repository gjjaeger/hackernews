class AlterColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :links, :title, :name
  end
end
