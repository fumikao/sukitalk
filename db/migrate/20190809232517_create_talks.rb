class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.text        :content
      t.references  :user, foreign_key: true
      t.references  :category, foreign_key: true
      t.timestamps
    end
  end
end
