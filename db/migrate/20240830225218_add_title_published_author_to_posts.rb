class AddTitlePublishedAuthorToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string, null: false
    add_column :posts, :published, :integer, null: false, default: 0
    add_column :posts, :author, :string, null: false
  end
end
