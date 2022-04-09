AddRefsToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, foreign_key: { to_table: :users }, null: false
    add_reference :comments, :posts, null: false, foreign_key: true
  end
end