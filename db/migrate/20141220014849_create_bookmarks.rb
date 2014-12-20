class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, index: true
      
      t.string :name
      t.string :subject
      t.timestamps
    end
  end
end
