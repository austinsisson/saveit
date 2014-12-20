class ChangeSubjecToTopicInBookMarks < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :subject, :topic
  end
end
