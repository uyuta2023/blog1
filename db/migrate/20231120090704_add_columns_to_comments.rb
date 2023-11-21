class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :body, :text
    add_reference :comments, :article, foreign_key: true
  end
end
