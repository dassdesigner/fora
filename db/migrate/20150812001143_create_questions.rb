class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :body
      t.integer :votes, default: 0, null: false
      t.timestamps null: false
    end

    add_index :questions, :author_id
  end
end
