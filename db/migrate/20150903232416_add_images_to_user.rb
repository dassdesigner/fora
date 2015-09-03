class AddImagesToUser < ActiveRecord::Migration
  def change
    add_column :users, :img_src, :string, :default => "http://i.imgur.com/Iw9xtw5.gif"
  end
end
