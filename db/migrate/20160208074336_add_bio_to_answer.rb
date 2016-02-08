class AddBioToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :author_bio, :string
  end
end
