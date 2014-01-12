class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
