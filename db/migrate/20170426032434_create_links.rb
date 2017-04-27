class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.column :url, :string
      t.column :title, :string
      t.column :votes, :integer

      t.timestamps
    end
  end
end
