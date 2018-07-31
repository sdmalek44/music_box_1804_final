class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string  :title
      t.integer :length
      t.integer :play_count
      t.integer :rating

      t.timestamps
    end
  end
end
