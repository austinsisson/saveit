class AddSiteDetailsToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :string
    add_column :bookmarks, :favicon, :string
  end
end
