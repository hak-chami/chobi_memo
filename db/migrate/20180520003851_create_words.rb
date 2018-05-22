class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :user_id
      t.string :word
      t.string :kana
      t.text :content
      t.text :content_replace

      t.timestamps
    end
  end
end
