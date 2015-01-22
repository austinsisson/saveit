class ChangeNameToUrlOnBookmark < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :name, :url
  end
end
