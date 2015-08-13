class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :votes, default: 0, null: false
      t.timestamps null: false
    end
  end
end
