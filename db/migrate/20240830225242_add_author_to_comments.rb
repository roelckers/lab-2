class AddAuthorToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author, :string, null: false
  end
end
