class UpdateColLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :like_option, :string
  end
end
